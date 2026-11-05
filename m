Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7429606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dbu+UGMq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LV5rhpYz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I2d8ijBW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=; b=dbu+UGMqmdCl/B
	FThTAHN3+iUQtoVhsI0h4jIox1w13mMIVF8VzFWu4HWF/DITTv8AOHYYAc/ZzzxmjEqnhCGo7tNSf
	eLZ3MHuSCJlZhRpBQSmizrnMFMXWWv5LpBe+PzmcmGqwFH3CTPkW/CMqi7MAUx5ixh3kf59aGNsqK
	vyVOsJ6iAx/rjcgGKlEAQnQIjVwr2HIZU5FEy4M4hkGRlaBzgSlpsA3zfj0SsZtaxYARPxv72PHbT
	tKnY1hijw3gg3DlFrMPMGQO/vA4syJ5EquoRqmaBNwnkCStG974SQB9ADeWBtvR3rzOzEk+rmUIbW
	Xc1XJpEXHmOkBtHcK2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsfb-000000087RO-0dc9;
	Thu, 05 Nov 2026 08:18:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsfR-000000087LR-1cSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:17:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TqeJ4138170
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Nov 2026 08:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=; b=LV5rhpYz68Pukncc
	sucjCXNXBQlpVt+QyxUcq0H+iQ+bTO6rR7Ap37bSdyStHxGBrOwOI/DsFmvIlGb5
	wDEmtQEZEnKaiGP075HOPgj+2oKZRrNUIaA380zwuM86zO1L6DB4tvTNkjcffvMb
	uoyMxeki+M5kmlNoRoj2ftp/Mb0fV+lWs8wzWpHZ8/e8KUlxUJNK06NHCo1+Wvs1
	Am4yqLDAxOpB3rO89T0V4G3T1Nut5PzoxQEL5UlpOHx2i2oz4nG9A/X2nklGFpH/
	HEcr1ao7fFRYjkjcpUeZxH8tRKQZknveQ4TFrg5X+CKQa0WHr9YjHwrKGcb/qPM6
	a4fkFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0g1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 08:17:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944102381acso31171185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866668; x=1794471468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=I2d8ijBWVwZO+tDL/vYzxsgoKUWaAEngSA9kc4lFA/xKmeGVhsoUHxJjZSeks0CPrQ
         ZSe9QgSiVg9vyjqlOUA7nONlAoyLkKIe1R8MXGdwe4fz/mVA/yGRx8cEXevkLHi0zIip
         9FOKI5zB9gmyWVebdcHsUDabXO3bHaTjfFJVy2fpgN/Dhrcs3Mf98jvwTQWtC65iNX4f
         sm1HJeQLWvkVuH+qRktfahGUeUXdOTjpEvVUxk2pkfhNEgFeq6bR3wnxwVdY4+siQ4RV
         JzXsGSz2GBOkLAwY+eCGV3IRGb7zMO1wZK1IQ9UELACBS1R8BE7nquSLNnc2atrrO3DE
         JABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866668; x=1794471468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIDXH7P+jdTY9AZB5lDTIxU+JVMIyRXXtejliGs9E3E=;
        b=RGtJZnOX7MscyjnKl0WPugXYGhLkybwDw9MNHJ7XTxtibxBWqp6WmgILAYfC9nGkQq
         EHexu/nf9ze03UIHfYAUmTnuj+gaAb6o52hztJRxr0PoMq+Bd2blrDgEh2H/2I68tWbv
         kilCLq+NxLcrzzA12W5ipKlj/60bT8hboG62iTYxF8/6nEB/8MTfBsTd2EU+ozj8W4fL
         bZJSkV5Q73S4AxiZXDEGUSu/6rimuJPZRL0WJNEwlKuhGKaSXQs68/PQNOMhIvC3Vfir
         TXhVmpm2UrUk1xAtu8xxE+PyFW78IE9xgNIKJvGKgBO/5rerlRF5w0638s4RS266XqO7
         MNCA==
X-Forwarded-Encrypted: i=1; AKwUvBwn0lKAOCTmdVealq6D0sNIpokmFXfpWPPutckIX5LUu02s7UfMjFd9NNO/fvzpoYI7dwviRlZGv27Z0EkzzK6l@lists.infradead.org
X-Gm-Message-State: APuU4Z8RIjoxj0lILuNMkH6s6tBWrAnYerzwob5kW3jdJuCgzWuhedRr
	pP3oU75I9PfajEj0TQj7ChIzGaMAYoA809C0PMj22JLZVJbYHHRbJgiWpWTeP9hdBe1/lhkNflS
	ZFcHian7B54sHWZ4H/McRIVEqYG6JRGdpDsgnrJGPZIAkG2NDTc9HKdf3A8Z6mBjQDIqj8N2lpx
	lgKGKKwn2zyw==
X-Gm-Gg: AYBFou2wd/41J2ksbx0FkiSNAWBBLz6B9h5FKoMM31mjWqvt+fxILOBGPwG6ifdjiCB
	kTMOOtV1p4PQnfoJqYrLG59gz9NpSAdbVdW815WJ92OFyYmTdW/xCyyXviHCeiyhoPMHBplr2f5
	RSja3ZNSmWQ1S1olKWl/sqa+CXHmys2Ou5ii+PibKOBKi6uUTbSoLT0OhJxY5SMDZdczkDH1VYk
	nDmOEH+b26QkQvODGm4a7wGQaAxLt7de70WFVoL45oiHMpCYG44r5sIZ7xSxU0KlTG/tWG0Ljg2
	DkwxlqTjPpi5alKS9DbVMN144mLbZGGBayAlICwuDn4y2EBAwD/IoVfj1UiIcgGNYm0ivGRSZEd
	unTpjJ2N+PY9+3QZIwk12Ay1HyN6fqIRy/G0T4dRW6Kk/VpLpNrunEiE2+2fwLICevivF
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969118585a.4.1793866668275;
        Thu, 05 Nov 2026 00:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr2969116285a.4.1793866667807;
        Thu, 05 Nov 2026 00:17:47 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e14093bsm150254866b.11.2026.11.05.00.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:17:46 -0800 (PST)
Message-ID: <d4be1b6c-3380-4c04-a003-9c7923839ef7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:17:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with
 defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-qcom-soc-kconfig-v3-1-6bd233ccd1ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX/tNsepN6YMfW
 z9QUaom58PX5PxQtj+iLeVe/WVgHz7oLS6mqgkpurT12+wERrZSD1VZszU7R12lLw86YUnzqZJb
 Hs6qRrjEacu1AEhMzmSOXgaEJQ0XEn4=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec3bad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7rGjOUnHYHVD1fYbDD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXxDHB28s1yN0Y
 dhIpo6LRs/yoVC01YrqeC3mnvR6rZPkWQ3z23CWr6955Og3y2TYvR3lc5mn+IRTYUlWKCXeK1Zi
 2ZCvebGIoYviLJTu+qkbQVRueQ/CkF1tLbUOQbiX6Pn654Uh1iYOP5Sv4c5xiKw1iobHZc4UJGq
 RUjRdTEALlUSW1KyAJrd0cA7N+8p0s7EqVQd5MPbDJj0siEeYri28otF4IOYO/i08igqYf3aIaW
 tviawMIc2vdQsfVCJw0gckYgowc8GDV2wJmZMw6uR36FqQ4xgNl0UmVF6UgZg0ZhdCHfyPPSx/+
 HyXewXCHrSBmBrZNHSMK6n0bj7r1HCM+vNGEGI2yjcbva+iYNZk1g81V587rIjoF9ZvWH+W3l28
 PHpZAiz8LNYpO3p9wm6BjUtZc4QDobRJqKBm27GQkwreLKB05HSnltHoS1a5JaQHmSi2ZPfsMYH
 LTkSrRG1H/8y2IUlBJQ==
X-Proofpoint-GUID: cjAh0BLwZm7WGONb3MMbpbGBjv54vpwI
X-Proofpoint-ORIG-GUID: cjAh0BLwZm7WGONb3MMbpbGBjv54vpwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001756_493384_A8697630 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On 11/4/26 3:40 PM, Krzysztof Kozlowski wrote:
> Several Qualcomm SoC drivers have defaults, so their defconfig entries
> are redundant.  Keep the few options which choose specific choice
> different than the default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

