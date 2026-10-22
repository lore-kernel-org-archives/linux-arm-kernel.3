Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E45606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hx1Z4wUZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEbChZoX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i6ht0DHl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=; b=hx1Z4wUZeHRPne
	pNcO+YmHWQZr65MNUHjkgqwtJzaha2GNWCdnaeFB84EwQHEDTCv3r69Iri0hshpiZIR29OalcjWw7
	5U3eZmAT4fYlxV9XFo/Cdwu4kDmdrRqsvIAO8TWr01YarBGs5tGWai/pnv1Zyn6jAGwwpCZeQKBUO
	tykm8fnPZM81Zr6Wm0RNpPw73xbeDMQa6d2/8riYUNcZeJWWqW5BGRkDoQObOVXlWus3r25DzCL0B
	S0oOeQv55IbbsUugnsUMBbmyq+7WUlxxEBSzHUwp+j5OxAJ7QParvsHP+JR5y71hwLfI7VQC6oSoA
	9d1T7vCoRqkkq7zFNcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJojE-0000000Dn57-04Wx;
	Thu, 22 Oct 2026 09:04:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJojB-0000000Dn3l-0yyy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:04:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xwkn3076267
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=; b=QEbChZoXe8SUQilQ
	v1DuEY5ECmVDOGhoRCzNdIMh1N/Ryw3mScFCEO4OAfzCVJg2H/Eg486DW1hyHz21
	0I4WgaeTiQq140nHo2pObmyJJLDzs0u6PQW6oOA758cus8KQJIO7yOiNej/0gNQw
	h6VoFPyBWUlrnTCwMxjKua9/+RfFvDDGITtAwqe1YgzerP7TtaXdLNOkeRnl3LkJ
	ZlRJaAouwQSY4pJCYRrGG5rulR1rKvligTj8SUKbgxnDqRaC8J7ext4KxptOTpHk
	TN8D8uaWbFlpq2F5um8vn3EmbsS2AicPl8ez9B/bGZOJ7C3E4AYur/WHbBXX5hWX
	6Q76NA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1kbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:04:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so46408585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659888; x=1793264688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=i6ht0DHlcdKbfEYhlfuqKKmzI/y/8ooe2AApwdHTBUPGnhpLCqmrKMhGuv6gWDA11/
         /VO3j0UF7NiSaYALUzG/MogeV0JINKcY2nfYqS0k/ZG1NiWNBfE3zbpNkvUgYKva0Nnv
         vbkcJvdogJGPtbNyo7aoYZhp8o+4PMzYs/xTQjaW/NaK9aMELInTJuWAR92UBGf60glV
         bRm0o/rA3jSFhh0ZumdfqX8uG3+7O1q5Ng9V56IK9Rx9ukZgx0f+xHhd6YYnsWiw91i4
         YDmCC+0RC5nH1kGUccWy6WXF4/rdYymRwSiAS9X4FtddQ4DHSpiZRt2CFzCXDXTW5VR1
         f9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659888; x=1793264688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=hHEREOq0FwLgKV9mu/QSRhaHKkLgybjbCJJvuTtjyCN+bAGx15zqD++h7d1nICUsrf
         rRrIRWyZx0w5GdokiAxLd5+UXBCIeFbaXzqb1sTzv7s522NrAKDAuncuYJerMT0dSF85
         fAuyD4AcCTaxhf335v32msE/6DlQaNd716mwfiT6kTwXjqq1bSKLjcv/Aa+hFAGcTdN2
         YyWhJa8b/TdD3X/F16mDNIhdKZEkHR/UyhAUgMIMbC/QMR4X5cK36K0BcoCJGspNdMwz
         QiqXmg2kDQZlU+AnLpjtQyyt+SjXCCjmFU8/4dZwnKq0LSOhnPH9ewGiR/d8ngaxeWX4
         Mn2w==
X-Forwarded-Encrypted: i=1; AKwUvBx9nWDdd4i5dzo6gNy/feLJQfHQRy7TlJ02/OiOU7lXIKO2tg6kzV1xT7fj60FCZ2z5032YtLyUOYEYoQmSS23y@lists.infradead.org
X-Gm-Message-State: AFq9FYJzgOSvXePCfLePthTOjGefPq7c2rbAwMevlZi1XpTCAH8tIPkG
	8Z2F5O+9F4HK/Fn7KNVlUhrVOUM+EnLf0uKYmWFzgvbtGz5mYgA2YNZjF9xaVmyF8JrLvvAY39k
	vYaMl2EGC/6iJdt2BCA3UzlpADxdmJFizqfBJr8LrwsMDUPhkMgpeFiQSeR62judiCrp180IDJf
	ecPw==
X-Gm-Gg: AYBFou1IK/3sFxeJP/02Irw9h3+X+PPfdiMGYp2DP/FVSFnhiSo+bYPFT3ynktDmBKz
	OxtMrof0auTDbCQRZEOeP6hGWQglx/5Y5MRsuFT++tfCOhAjOi1GaK3TrvkG4kJHB2nwDeaCZck
	4uqq3nwCxkUPzjYsRMW54A2OJn3y4YfHpm7QX32+kpcsolb/gI+q3wq22OwwhRiL7GemJHNKtgI
	VlG4T+VjBRKiuc9slo9+fAQg6dq11I5M0t71zjpVf6sowO+ARVg4nsgvuKOVqurUawprtrPYznJ
	viUo1b4BNJ+iblrTLVrDYojz/weaWnJoR7SNRZp6L8LDYDXCbbFnxVdc4OVsO2wnZ65dYLJYSBu
	VMcyv7IHDEl7x2zE8pvnOig==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986294585a.2.1792659887594;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986290685a.2.1792659887103;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e13d2sm81040666b.72.2026.10.22.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:46 -0700 (PDT)
Message-ID: <39e5f5de-c9bf-4817-b0e6-c598d421feeb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX7Gw/2fhc2sPD
 ZmvQNCsSEt2ZAQiIEa2WqNwsUQby1SOpF8NIa10cEozRgoZewjDMvqG+xQ43fvryXJMmk7nxf5p
 Nb8Bh7Ydzp6gHTfo7lHPE1HeNVgmSrBzBasVzXIPDS4FusrhyrYIPgJO5k+XtTGvRBtuZrCPnPf
 TYPk+YKJxQqL1zKAOev+9Ggpnqhrn6d6dQC6ggA8hv1NkoG6oaXhA0bbo3Wk1ECc379i8Zpob4F
 2GjVb6bHeWl+85qmqms/vw+j4OZ0j4Uj96ghTRmziGAjRf11ZltBqfmmfutnck2iyDizhrEvNkt
 CrC1r3V1Bp8pNcv7MKnykca/tYwOOs1mANLMo581kEMAPrPqjzG6A4/Mu1qHuddoJ0aP4AE+Px/
 ei2OGjoH8oFFOIt+ys5nv5hsGalrvIXfaLEPVGsEcO7AIKzzllYwBWxA2Jl49Lw6b5eMASo5IQx
 LI0Z/+QXLOuSyd/mWaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2eesngyhZB08
 tOyV8+hYyY9TVZ81MrcKJ4e/L3sOOx+PmOuDuCPtrhrU47swgdKFXCdUMxF/xzllQVoG1vsTW9C
 KljEAVhtRG8ZvAuf9KYbDGhwKpfe9C8=
X-Proofpoint-GUID: tdMph9D3QQbjkV0vr-niyEJEA5ShZWmJ
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d1b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IWs9GYwE_XJkEP3BLIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tdMph9D3QQbjkV0vr-niyEJEA5ShZWmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_020449_381317_F99D73CB 
X-CRM114-Status: GOOD (  15.58  )
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

On 10/22/26 10:58 AM, Bartosz Golaszewski wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provided
> module parameter defaulting to false. There's no reason to further keep
> it unbuildable with the BROKEN label so revert commit df373d39c6f0
> ("crypto: qce - Mark QCE as BROKEN").
> 
> While at it: update the Kconfig description by saying this is an
> "offloader" and not an "accelerator".
> 
> Cc: stable@vger.kernel.org
> Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

