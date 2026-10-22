Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4gY79LLY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yyn8mJ9k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=; b=4gY79LLYGP/HRumVLM/tPwVLzv
	Z3KFTnS7RdoydR+drYUmNoEShPYAqBifh36t0vIO95Xh8RxaKOuSdtQlg9JKlObIQukEX24/o+8qX
	BWmKIj+3ZZcID1xCYGJ/nSQMqlF6Xy14bLXqWsoRJqOfC07WQ/0c4P/TcmGT2MxZ8bQKFKDwtlXKD
	pj1VIlJvNpkI5FfwESLmpuqDC4r5jcmChviIBhomm5W7TNN44WllfrXvcO2M7V82TiWMYvmXOqwrM
	fVn71Zqo4nXxJmg9P16+YcfdtnAt3WvEpKOhbgAAGh4pG71j5n6ev0BZMpTuLa9Nu5jTgGrcguVUF
	c0o64Nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnnR-0000000DcHL-1vOS;
	Thu, 22 Oct 2026 08:05:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnnN-0000000DcG2-2bQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:05:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7B49Z3049217
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=; b=cQOhDfF3r36vj4kQ
	xjVtHletR+j6W9y+iv7K1etgu5d5VhhTBr7ehV2hi7fnaB15JDWRewYPUnXPrgjd
	i4s2CyAnp94GdXmwIKjaeyR004RAWANKoe0azq35ZSo8ygzHUCJpxF1pDMG6koXp
	W/weUD6pa0mywBn0pFPUsUctpIXz/Nm4/a5FRJDusNpAJgF+z4DrPBCnFrfCHEPE
	LDofoMC9sbjelgpn2m58YJnTEpn6ZYwf8UGgpsrPMvwOi3ci9fsbmlYaA22dlYkx
	LfUlckblKMZlS4FFcb+BM5ZSmASur1h8AQXGs/jzlxyrnZ7Tfs0ELnB57r1fTpKn
	6cQ77w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asaex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:05:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so32226885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656303; x=1793261103; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=Yyn8mJ9k+HFRIXPCWKv1UwqgcaVTUZA6Z3fw3DvXqZnqqFuLrbtb7rtXmAbsN6imB9
         7sQuzsKD4jocZ/hU5jM9P5Y7JOwvsTfusgfKhbvuBm5a5jEr/udwWo1MjHqQpaDCLSEc
         uhZ/Jk7xzCw1lpfI8F4Xr04kGeq1pxwC7FzU98uOCiUiTu90P8yvQayCu6EQpy/bNm3c
         mH+Xyjn7h7aRWr/oad8jl1JcSzQRhYl4gtgSflOPZ6b1vP9SLitqCBg2/4qDhZOxX06b
         MrvngHMzmQkscsrN+ONBL3vk9REFYHY5kiX9sx0Uw/CJdENMoE9a530JM79nFH/SVMEL
         IELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656303; x=1793261103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=VSyQpPJp9RvHF9G6DsoGtcu+ep8scX3jiuLG2jzcKrLn/DBYOF7/5c+fNOjU7heB/g
         ORew3ektszo+B6zi2g6PGdgY5nZtvwRXTY1ebzzWqEdnM4dmlf2DJUaPHiT8PZKYY5NO
         Z9+RDReJ3CLVdT3Wz7BV39mLQk8BR4WYJXQEf3lQk7nFLoyXL397qkLQ/5rFf03uczlW
         5nQ+o3VVs375gAiC+fKvzoQBOhNDYVG20u+oX4TQCjzIi9rkzjXkz0kb/mnf5qJGOKpO
         9Ouq7ygHCLB/XI25SOYz8E02KiZljH4d468XeSc3dh4yYUyU8hHUUj1Sr3Vs9XIVuQu6
         cvdA==
X-Forwarded-Encrypted: i=1; AKwUvBzA2p0J4j94cJ0VLd+UkWPxK3f/tuz0TnTHGF8NzCN4IrrX1iYTjY6y/6PZ3cU6Gnr+/Aod8XRstbkIuHEzwDsc@lists.infradead.org
X-Gm-Message-State: AFq9FYK4xNEt+vok8XaETMWgwThhz48fhx43XXcZ8vGf8QSD01yx7Yve
	nfPD7wtfEf+7G+oYqUnlda2DijnIbw32uxgEWLQtc0+z3LIIU6CEpa84nQbLElHdBFu6dID9i30
	NkKV19M+1KkCymKpDhvLSPQ0lmiPN3x0Z1GOzOIQbryDqY7uhZJcsqJOhwoe8aMA5XuWEjb7h/s
	SI3A==
X-Gm-Gg: AYBFou3Lx7L1JSVfwvu0taQAvpjTmL+EapjbfZj1soR0BmHkvsZMgURUt7utxs7hh/Q
	ALcGtEJ4ZQVt4JRx0MeO3wgnSy1qEVannjjCnBS1ENZBMZczhEmK7naJeaStrPBhf3/1nOR1Ene
	x2E9h3Pgw323uVXO/N4L9YJ+31UUTrbHR02ypDWoQqnuleVgO0/7O4uKn828RsLdUqprDyCTRmT
	Rvhagdzsek77pdzovQCjJBbiN6hvVRy6GE9miaR7YDleGcjmT1c2eGi6j75ddnwMYBgPcFUXLQ4
	Psi5FrYzyh6WM+8PRkpqgA3k/ZqHAMbVF64hFpaEJXdy6O+VQ6rGQAGpLcRN2cHhWudfA+pbjlw
	ngxYmWRRmGNakrXWIVdSHEQ==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932520685a.4.1792656303046;
        Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932515785a.4.1792656302652;
        Thu, 22 Oct 2026 01:05:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a610a92sm76425466b.80.2026.10.22.01.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:05:01 -0700 (PDT)
Message-ID: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:04:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX5OBaXXr0+V9T
 DyRXkUuX8INeSp9H1frO4dXv8GR9QMKHgsGmkKjaxNqFG+H8ASrfGwIYsSdqAdPnUePW+89Kddi
 J/ZqW86ge7JlT953QjGQ0zcT04WOfn96gpFFA6RtBJ1TZ9vSQLlfk355hg8a4QPdS+z1J0TT7ti
 +8jddmnLU9YnsFGeLU6csGUathd/Cif8FaCwj2Iw30gNOf0QskwQDKPQbxVL4oqtjG7LpN73JeQ
 t81DjYp4G6zXV0Pwx2U/YJJr6tCS7Af4V4OAtBoBKeRPa827pCIPQ5DwV3siT5AggxkISoHOBTS
 YDCsfLjwrmr7GofqQrIIlHGyiNlfS4xvvXFVjeQc7I8zRd/PzHzct2kavefg8Gabo8ePxmqazKc
 0SXXHoV3OKPDsQSS4zy1tdEdAq3yUYBq2jK3eUmNMHb0mwLnM4Vk6BgXUO9ngfhYpY2STlT7qEn
 hjV9pNoeIuGXhoQcSDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX6jRA62fl2zcY
 rhg+oRFDeARJX9v5zj6G8UkjDY6reIp3JuHlOmMgVwZtj8nvrMVguqfzTsWwHUkOrOTnjbMKIPW
 0MzHOP+gA7SuZwLZRFitrPgPybhezJo=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c3af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kz7q-GqAsz_10McoYYEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4pREe-AiT7FX0wlKGilOac2rIgws28Jn
X-Proofpoint-ORIG-GUID: 4pREe-AiT7FX0wlKGilOac2rIgws28Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010505_851715_AE7DC20C 
X-CRM114-Status: GOOD (  11.56  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> default on the Talos Lyra EVK base board DT, to provide HDMI output
> on the DSI0_B2B connector on the carrier card.

[...]

> +	vreg_disp_3p3: regulator-disp-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_disp_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&lcd_bias_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +};

Stray \n above

Otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

