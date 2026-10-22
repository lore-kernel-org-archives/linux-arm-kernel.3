Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13324606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lbLUUxLD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8XKDOF5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=; b=lbLUUxLD2E9zZT0p4Z4c0imsHY
	BQ5tb5mXGfjYksUY/XnSu8Jh21KCd7ktL4dt3v/ivozWuOgUH0jjBGRuUer0b4MNV1gngqmxo50gr
	swA4dM4It5jN7B7vVQSZG4geyYjWKREMjns8t8HkQvTD67PDur4m3rfDq7F82/BpxasQGNnO/75Sp
	TAahZZ1xBQ+iAu3rzUCGksSl6LcJ7fSwJfD3Qmf5ZmVl4o77XHc7W1yo3Ghy+Q/j90iEb3B/B1Ldi
	c4/dmO+cfK15PwTcI8r3E0Nm2ptsRW/EAKvw1aHnMIx72srLu3WOdDKrDugPFES+Szsl3aKQ95MQL
	pfcLg21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnvh-0000000DdPx-0J4J;
	Thu, 22 Oct 2026 08:13:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnva-0000000DdP2-3TID
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:13:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706a41995970
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=; b=Os5qUXmIQbX3CzGJ
	FX1mxLp/kv1/u7jRnXp0HWIH6Ut24Traikrrr1Wvf5N/dydrT9MBF05BxfA6eQ0h
	fXRC6bC1bLHwGkT/z0Q6D/zCarbOttK/qmEEMmwz86q3YFE08QMvFQwbFCRrux5j
	izmxjzZntCi/J02ZPgKucRJ8mXPLESo+3gFuuHc85zZe6GhWxvxjJEZsjr34tXId
	/x6HpxgfaVbP7sEjE8Iswl42t7LEs1GLlD9CDrJQH1C827cvEZL5ce1vQ4fU5HEt
	+XSIf9q+uD4OhoTjnFMLzsiZuud2xEoZWBALdZFl24JCsgWzPBWgr/IlNzcQvYhb
	JImm3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsc62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:13:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso3726101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656813; x=1793261613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=i8XKDOF5USD6hg9+vhsR/psSAXPKjT2Q8xORUFD1hKCOUARPnAp3TuuoAVccKhNylN
         BF0bGdc4XiEBJAxhOaeptbIFq3MlNqbGbbDkO5LwKLuNyDReM4A1n5OW43j5HUDzUvtb
         kIlgvStWkuyiA4H0maj6YIhoq1t9awlLzyJWmql4Q06mg+XJbJtrur3ihmG8KdoJn19U
         DLlnPouQTk6OmRgivQr4/bAtwoKWBc4/VdU4jB1KtTBzhXHPFtOTvAvw9x6qBAF7CkR+
         XKlQ27HqBpM7sjEVyiEeRH/VFtk7iIrlawIAm1GVhniAlIUPhq/PIYK4mq5x2nIUYV+3
         Vbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656813; x=1793261613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=X9xheKC5R2t4lmTTgpsCpm7SRAqsM1Dvha+NHyctp1l+YM7AYOtHUaNB6Wq8NI7bqN
         NB3jBFhtDpg2PUBlqECcoIP3zmKU74uN2Cw61FgBrU/dAbmK3CZ9+YQf0cM55qs0DZ2q
         nvOlvfPINfNXctV/QeluBIP2tHb7Kh42+a14SMnTSiq9JNbcUltwrJRpEYYHGQO5/Jzz
         8KAaJH48g9Dxk4F5biROV6FQTHzf9W69DQM4X4n1e+8nUasQHwuMfbjq+d9QzOoSscdQ
         L9+KcgWGNAcp5w5Pep6N90daBoc0489QlHoGyDlKpkHKIlO9s0WwLyfzTXRaMpX72wHr
         dWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvn72rI9f9o25wSNzTEvihhb8fmYqaGKjtTgZKUOZgUFt5dZl55sgzx/jN2peaG2xeoMm9z1n9Jvntjo1XK2mm@lists.infradead.org
X-Gm-Message-State: AFq9FYJYwVGom2lmoyBfPfPt3mwieMPPv9lqIiF3sGkKEhSi4CLNAFQA
	FLAiEO/gQzNf8mazNZPhVRLcHNnrxZYz3tCC2rxHalCuTK5U6GN/CrpOWv7J8nh1tUIoYEK/IVT
	GgBbe/Ukwhld4CJL3stYhQOMet5A553TscDmkS1uGqNjLkeMIY+cRMXlG6VnyCv1lWXYO43Lx9a
	f3WA==
X-Gm-Gg: AYBFou2N1fRkmiDQm3MW8sY1C1S/7ORf/cP3WjAj8n0EcuEV1kUal7Oqb5jDPp0yOCh
	Ndz8qchup51wc3edGPGDt+uFKJRB2UQSZfI8QKHwsv02hq2xeoyna4icmWJHcRv4pfF9R1s2mbu
	BeatoE8XZXxEZWZH7h72BU9HDCmmJYH7Azmh+X8p/JSZRWbqTztxXPk1p50Xg446cFgIuUj1t0v
	T8GSLHgbaEQ47n3ve1ofpeYlXxRTsfsojyO4NLpLa2HKSb/OVTWb5X22AzJi04blDJsg1CQ7VJu
	w5dnw2DmsAbSzespk5f6/LCaPa11SqRCpqawBgOEhDIdZTFK/R8Pz1Jf9KiF3t4mcaJ13x3f7vd
	0X3mjzl1GxDTa49sxyzWyAw==
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255571cf.4.1792656813205;
        Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255271cf.4.1792656812768;
        Thu, 22 Oct 2026 01:13:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e6e33sm77669266b.75.2026.10.22.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:13:31 -0700 (PDT)
Message-ID: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:13:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zwbiguyfoEi60qNhvJF5bS31sY9tdraw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX2l6bZzu2y9CD
 5J9X5Fjg8eSK9ox3YBNPo5ojW/OVfBLej53qka5u9sF5SIWyKoJwsJnYCJDRp/8lAUPt6pIE5AQ
 14imfld4qcr7huIIVkuOm911q6r30d8=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c5ad cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=SyOgNX5fRjsOj9ann1gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: zwbiguyfoEi60qNhvJF5bS31sY9tdraw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX5EgQdPS2e6Qj
 GfKsPG9Exrok///NUeCx3J74EHswekJHXa4yqRWwb+LIaP4CY7LNaw/iBkJ215knHjLVrLOrfZc
 4TaNTQXsy1AYwDKW3s9oOdcxmSZLQVz6MFHJObi2A7vO2I1xlgJACZuQGdgSDJu4ZeC/3LVK0AM
 0OfSTfQEutrpFUMPAj9iu/qbbl2EAHKI3+HcgS5Em0ETeqgGfcjpCAGpESjDTrTTQt49U3gxKz/
 LMZXOHQRGTWINNBoL925slWsPJdSV+tM5et4c3dsV/JKxFijmX1Sw5/lykplqmFFkCpXwfL9NqE
 byZ7uyFGykm1KzjtnWK9/RPcSA/8PPsASajkokbCbo2BUeCKwQYA1xBWGPd6lZRkJHOAjbKYJPp
 8pDwHIadKhaAvu0cFLtVbaKeJ79tSzc9WFFKj4wen4afqDrrnYkBzic7GavwEJuBiN9yWr+8Np1
 iFmKi14vhAyJt9eaTZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_011334_989393_F2901990 
X-CRM114-Status: GOOD (  12.19  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> LT9611UXD is connected through I2C4, with reset and interrupt connected
> to tlmm GPIO76 and GPIO85.

[...]


> +&mdss_dsi0 {
> +	panel@0 {
> +		status = "disabled";
> +	};
> +};

Please refer to the panel by its label directly

Konrad

