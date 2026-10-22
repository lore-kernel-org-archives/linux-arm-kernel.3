Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yawhUiRV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KSoBzz/v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHt2SZ0r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=; b=yawhUiRV+RAVf/1dzorp1pCmhc
	7V+NLYwd79aRYBLBnsyumB7NhhlWqiWQ+m9xaRRFquMDn8BrrUf/NuE99dcXR7Hj19Y4ljtkEN2mS
	JYBDDhR/dvgtN5kEj2wLVDX9RuolWrgY1OmENzlPA7mmtFT60k7gAZGP/G5cHIPaTZv6lT73pNGik
	HlMk1B1bqKJ9du3RakSmucvigfqgGxE5pDc7ZSvHH/30utiz0RGKQ38HgKpoOyVpHK57a2niLctIf
	SikDPPF5RCQ5Pfv91qQF74ocdpYfs19/hIz9y3rLnrkn8dRqJ4RI56Jk24Lw3HomEEuP1FcNHD5HZ
	u91SVfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnpI-0000000Dcbr-1WUn;
	Thu, 22 Oct 2026 08:07:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnpG-0000000Dcam-0pgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:07:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Phe1998818
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=; b=KSoBzz/vOnEAcmUR
	NE6MOuz4yfbn8o0Cg0oqrDxDbFHNIf47o9B19dlfrRAtxJF0Cj2afROVAAlXLC3Q
	Edl+nwOeTVEm+h+0YuZgEk+TnJVp/jSthZwtSR+VRHbw2l7/MRJEMg3YC59U2nlC
	9xLyJ68E0sLepg7YeeIggd3O9+zQeFEqLu1sytKEwW5nGw7p5/Bqwub9MHynFBvT
	yjczSTOAvx5krExocE4+DjrOS42RRJOpZpr63xMCGS6dB11mSid32pLt2bNgg0Ag
	UGP82t2ubSDBY/gGGnXp/sWuznB4vn2n2AS7rKs7j5yDOCCcmaGmMd0oing/kaIG
	QVzd9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsb9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 08:07:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so45212685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656421; x=1793261221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=QHt2SZ0rsVCv6i+arTaC7PpbSHpJLU8HY2EQhbaz/es8dZJO5sjyjoRa/qNsTo/Y7R
         rVLmbRsknG/ATVLJ5x7IhfqdB4voKYcRJ+tvT4ppHX1YWwcYDFpQ7t3zm3sF6XR8/LEJ
         oiT0XzzOkCGViBNS8x3DYpf+bLLN5RoqZnc4IpRErRxN9lcXfcz87WuNsm14bv0NqLxh
         NjGkMcCpzPxrKAMedZqV48TYvYX1oJJA3h5EMb9u/OxrEG8fQ56pvFwTdqWZ8pR2C2MI
         OYJ8GDgUdAqTYj/yfhZhmSDazph04ne1SivKQWYSFGqb1uaHiDrAtkqvUE85fxfmtObz
         6jPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656421; x=1793261221;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=t4W+XFfWVdGoVoqbRDWZsRpU8pTF/3Q6B9sWc5+QQhTMGYzyjf7eqpCJtmrd/l8Rs4
         Shn55bwiX3lRBQmYi6/8hkDuLhzSTILWoFusVg3FT1645t7rfg+UElRkokbZQ7d4Ahk3
         L0PqfRWFUhotdriAVHnMxdC0jNVGDEY/NsYmgqdu/VnteXU/T/SrgbGBRoBZsNlFgj4E
         WVWeBlOQ14zIg7nz+xNFAKfbwuwh/5Gzx5/ddMaFWypEFp/9WnB/qw47GExnTzdRGOOr
         YQgX33OtZSOVQUY2cFh09yDAyieXJRZfVasyQjL7kh7+B8OhOXfDMuZW80B7kxTHlOT3
         3RqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4h/D1hcng4h4TQgAzHeAZ4HHNusH8er7rfEnEFDnHUthnomRFXOy95fz9prMqIuhscbysC8AEzB3OIEzleAvx@lists.infradead.org
X-Gm-Message-State: AFq9FYIepzo6Cw4AoM+bmoXssHRo3A6fsXrrQLmLsF2FoHMdj7c5xXM3
	LmiEeJ1pIO1V4/Q1PLZPhhWdR+3eQBZ9EqC8VNdo5+NCG+N9sSdrL41A/Loth8LhZWeP/P8h9aj
	K3LNVgQIG256rFTV136kWWo6Vrw52Bd8kedpP55As/GHEaHfIQmTUztEKMgB6cyxMYseJRFbqRf
	h19Q==
X-Gm-Gg: AYBFou3QbEFuTAPvgA6cU0vGAptriJ0PGxeFVeGt17GXmBu0WTACT3O7cxT+NnIHVaD
	1bvNrUQKY9iObYmLFQXNJ4eN6yjka0rLdT9i9bmo4yzFJTSB+LwphyhzVZsThtWVwLhczXXpgNs
	i3h5Dk/B7Vk58PYIoAqKzn1huJePr5wJzR7sMyjKBbj8ytPQi6wQkNTFijMXQlFnZPtswUkOpuv
	3FTgA02qsT5ywHGfTG4SNt0prthagydncBapFE6QkTYsnORrwF9RcnE0VOVjMG03RLlNBzbZsuI
	sFoKwR4hgq6GUVEPkkhlp6l8Eujf0MxnyRtEUZpGLCMVBn76+rtEMvrZhN4NlGigwGItDbAPudI
	M1tqfc/UIKwyCSGqhT5fCBA==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969073885a.2.1792656420675;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969070485a.2.1792656420159;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm77789966b.20.2026.10.22.01.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:58 -0700 (PDT)
Message-ID: <1064a495-cec7-4a0e-a007-3b434576ebe0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:56 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i_h2lSiOuZ3s975oKCI6QWM739A68Yde
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXxm6iQpWKdOD/
 FFxQx4hJYIUFh8MpAR1anowenANbX3PUXzt/2nlARbP5rRhwSgN4RxUvhs/URkD+WK5GpYK1Fgj
 tRI81OT2/jb+l2q3UR117YxNqjW6VqM=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9c425 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: i_h2lSiOuZ3s975oKCI6QWM739A68Yde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1n0uTxSas6qo
 /yuZ86jEvp3CWzMZ6WUtW0bl4JC6SslsJU4OfZyds41vjDTyuV6gxdUPGt4/nAfu0i2VXhIuZaq
 3PwL8fG5KoVE9hAGD2qs2VwYZN1bFaANCMjOpy7jKqcqaS0G73N8UkSkqqH+JKZWQlgAeDt160T
 +SscbLt26iuroBT9n8GoWzgTeHJHiTCthVFnPEfleWwqXhVIYkW183C8dRgwTD4zrBmwew6Ub3i
 n3AXDjkoyikA1mdirjVh6zO6Liz2M9dXEnKQEZHI5EOGxI3GnAxeBChuzCZaOaSzfFmcFPB1coa
 UElV98sNVussmI28A+35XiZGG79wzedxABW+0eVz4HuyjxMWCDvwb9S/4Kl+n9IQn3Wh9w5sk37
 i4sdJv7LGlSZxFvijEljTxTQUnoPJAzXMrA2kdA1PyHTbNGiLkJBZp1dHXeVBwJw703TJ39oVGx
 YmaCtVHDysWVRN31nvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010702_351994_AFF37490 
X-CRM114-Status: GOOD (  12.74  )
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
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
> DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON, for enabling this 22pin connector.
> 
> Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
> panel power, reset and backlight, and the Goodix GT9271 touch
> controller.
> 
> Disable the default HDMI bridge and connector in favour of the
> Waveshare DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

