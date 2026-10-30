Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0349606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WSQJalA+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXGMf4Rk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KRlJ9olX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=; b=WSQJalA+WKYv5G
	2z+WRjN2gs1QleoCZRxUHjBYCFUuPCVZUU5Uq3u15chOI3KFuV1zHEWffdFEjEFbRyF/lwIYFGN/F
	zjnSD0rCxIbxDEH9OG9uuZTSpN21Npvpm4PhVTjY8tvEyQRPV+BuMSV6aUC0IB+cUCIbI2Jqkai32
	E5SW0cxBLqwiTgxmrR3zfdtg8TSeVs3Hq3D5TAcD+PCPLnuEF+EbrEP4Yn2BIF0gzKNKY9QB2yWl9
	3KC1FO+io985dx4HGJVlSzQ4tkCkjlF1EH0fCwqIzvajPiJyemkAtYf6pP5wa4Lv0AwFoFZSzjan5
	gkEwU29buWskN3vJjwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKW-0000000BTnI-2P5g;
	Fri, 30 Oct 2026 10:59:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkKT-0000000BTmp-0u9J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:59:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FM9b2135149
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=; b=NXGMf4Rkgi+HUugH
	hZlJfzDe7dKqvdrJ9ndyLIUXPxXB+FBT2cMtVXbRPPSHhhNp/+dcLdaSsUMFNrsy
	UQTYRWiw9WKPSQrFixI3g4jSyq2LwIR57b6pu6JNMy+WcA9BDowddjSrFY7HC8Pl
	sEWH8tCZd2gzsE9wtQGZIuZbtMtt7vAowzhh9ngzEBG+wMUbBf+mMdxrsbm8jo52
	csGuBlMuZ3/V7amzAe6fUSTO92Vavg4M31qQCN6gd/1+xgnpWzS86EtQBnpsNP8z
	sooCTjkeJRAFCaJ0+rzl037EDbfAiWDDBJKRw+St3+gaIfja8hepZ7cledu8B2ip
	y0eWZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjjn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:59:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso8050405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357963; cv=none;
        d=google.com; s=arc-20260327;
        b=K17MR4fkpcYxhO47PL8OS7dOENOZp34o5eGRqKroPwcad82JaHL1DzRWLoNyz3KpIl
         yqATYftnt8WCmT9cwJyi4zpw0p+VlkaoxDZGizXfli0yNJi4RCPxOuGF9N2R+h9iyhRi
         CUrGLZnd0gDvFlNUzglhH6i06Gjx8/0piSz9nVSp04k9e+5PrlCqEYWVorWv8exYIHP8
         QKPNh+xOI8MbSK1rAAHSnsTPDNtUQXhusDdSJ2DP/oRt8dcRtnw7lqoiGG9Hvcb6OEkM
         YYYiYhxWjG1n+bGw1Htr0TIDW3iSnmy5hzN2rabCWdeC1Xa4tQN4WFvakGk4TXOKcXaE
         ejVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        fh=nyuSS9rP1r1wjogTJ5+i03TfdGhlRuvDbaOSBCoWFts=;
        b=sCbqwXIeBAVC/Wdx7Y8tfghlPmZZB3j/F9D7uE27cPujq6YqlfV+IfcmKVvVMp1jFs
         qSycbKrsshoM20Te6ZWUpUiuPHhjP+wga42Gj2OkzjdaNfF04L9ha68WZRhOwAeDB4+Y
         NdzpBI1r39hNQ8LbuJy+SKdW/91COur0IXXORE9nvkq0+53FFACW+WpBMIvJsc88GYhL
         bnV9pLqfevWEAEui9M8bl89RE2QHe5b9Gf9luouVrEjVzhcwEBLjlS1ZR73L+YMlEDwS
         m5HINybingqf0op1e9EELy05PbVMP2LDYHe7TzNfihuLaJpMur5k3CZJ/wMkGkpRlGbN
         Nrqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357963; x=1793962763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        b=KRlJ9olXnUhqOR7FKCiVfT5MzUUjG0eVLiClwNzkrmlS/p9U+8g74JKEbRgyYGl2/p
         4HS379Y7+RQ8HtO+PwLLZ/tUPgnp4w0QcD3Ij6FfK5xcv6LgF+FWWh7Y44vPqcill6/z
         O5Dh6uRilU+oWqLt3tYSO0KuE2vkyp+ZHV7Ojs6F18YLtLmUF76JWIkYFrFgfAtN8Nq9
         2DmiGfF8TfrrAKt7HrN82Lm9NTceMC5qshLSMxWA9TuJQX2WjoqnL9eIFTMs6KErzosI
         Q+/GIogXZbwistBGYoHDqUJhKjN84agnRz/3wW8Vy7EFi7wDYXTnLzPNX9gq+kn5maCZ
         J4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357963; x=1793962763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DU0BmoKanDFLwT8UEH8ag18x/Sshh1zOZeafnoOkRQA=;
        b=j9lLGYhCh3zTFPuvrmWYUyMw0vn+4YJEjE/RA2z3u+kE8tILPgLJyrUTSKSPuppEPE
         P5ZFxdcsGAA5wXUb/y3Zb6yaE3YJKadnWP7u9gEXL9KaHS5pI5PJlbaGbVKFdQreGRmQ
         fT5wjMopVrf6H9b8aJ/m1HglJ4xFacDWZ/VQqXH8Hfb3DR7XmxSMaGZR1AhQ+KUkfAUa
         e7xtGyn4JaSGoxzvpRvYo7AH5aWL+/8VsyWq8XRExrewFaPPV3HSUoyH7vtzlTQ4cXDG
         FI29BKrczMc4O0g0VH535HBrfuJzDwm6mDlCJHrzbkKD1mXI0CemHDi5VbzV41Ry3D8W
         EaVg==
X-Forwarded-Encrypted: i=1; AKwUvBxF3wtiHbyxCx42dcHF8VuaQvOmOGviwhVh7UGb13gUqG+/yKwfXvtexbesR0OVW3zwk0WYD+ydZrDnV9rlnxiT@lists.infradead.org
X-Gm-Message-State: AFq9FYIgZuAMRVH1ZkrOfaKeQGeyKMOLMCrW/rD7Gu+MEi42PmnwYPsw
	hLC1GJHKs4/wCy0OJSzst4hfypQn7kc/4IRSl0pOeLHylIUkwhLV96SqK0Rx1aP78GUzIhlfxnO
	gfiUfYSPjqnO3ho+lB71xBR0gJGP4ImUAbDf3Yyzv/RkiBvvPwG7txVrx4SqPLA04ykXmb1s51W
	nF+Oed+8wikqMq600vJ6HWlkVESplrfckEjEuZ9bvnKJsJ6gue7yNc
X-Gm-Gg: AYBFou1d9sQuv1f8DF7Yu7tnlF+OkGCxWa9uPPCmazNFsdd3h5bLDS9a9T9Qfx/LTVd
	MQAdKjwJYls8eVv4aclO4XboJnBtVwzxN4PzGGL64xUZh4i13zCcR5vDwFWr79Rm90pOf7Eky4f
	7htIAW25i/qeymDSh23jHwRnZ6g3YZxJnAL2aYrx1jUCA/7UToV8FnajB2ig==
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2eb364b55camr20159645ad.31.1793357963433;
        Fri, 30 Oct 2026 03:59:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce05:b0:2dd:ad73:5b6f with SMTP id
 d9443c01a7336-2eb364b55camr20159505ad.31.1793357963024; Fri, 30 Oct 2026
 03:59:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009003201.68288-1-kmehltretter@gmail.com>
In-Reply-To: <20261009003201.68288-1-kmehltretter@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:10 +0100
X-Gm-Features: AclHuK-BIpE4fV2IeH76KyHZZ83cOZXmUKrwETbmZLgjmf4hb_uw76VEZ66rz3I
Message-ID: <CAPx+jO8xc_OiSJ2b6BV=yPZV2DU8Bq4AyA7HkUYMkB6=8w85xg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT registers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8A4tBz5E61ZA
 JxQI4kmr+1xRLKvC7u/3nwMJ9IeLsJ46cGZRMWEJyqRhPeH5yibBB+SsaVLVGKConSGqgnIJOSu
 HC2yuAC0ahyf/YcwoyP6NmuGsMEYl+gKQtv4gQx3GZTsrk2sJJR0zLlQ3yl3eyzdHLry/N9cvVD
 g9E/wFLAHL7ovI1iyJqmCDpyYDp0RdeLa3fA8Ef3pyfmsAu3LL+FVAH9oZx1p3yJoRnU+CJ/z84
 EURA6UL8HNnOe2FwIp07hM7vdjmNw7ApohC8hKZJrLuqwvabOe7ocTCOVY6I8VUBJja+p5IFmlL
 cIK+1Hf7VLggYM+Hfuei7oqOaAPjlWZFeaENDXA0MhUNTFPWbYHWWzUmmhVK+21ZRAgTqWqkJfl
 zXBfPYrFRJZBdn2K0/XH99HpTvet3e0Iwj63roUp/R6311lYioL9WyXmioX7dadcn41FrZZEQA7
 94iCYmsiKikJ4iYoZYQ==
X-Proofpoint-GUID: iGb1pOeDa1iHuWT4B1SAMm1h7c7glo9T
X-Proofpoint-ORIG-GUID: iGb1pOeDa1iHuWT4B1SAMm1h7c7glo9T
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4788c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=AFOK113v-V9XLpTQ-4oA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX0SxAKApFWJzC
 w+bIbYHgwkr03rmEKBv8NASOR2YOOH01UUv2N0emY+j3tHWCXs3xkYZRnKOMLeig3KyfKHdpHuM
 t54lZjOiSVECiSb7gOpNCoBLeM1+TO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035925_257006_AD4B93D1 
X-CRM114-Status: GOOD (  31.75  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 9, 2026 at 2:32=E2=80=AFAM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> The BOOT register range is optional: the probe function ignores a
> failure to map it and the suspend/resume code checks for NULL. It is
> mapped with devm_platform_get_and_ioremap_resource(), though, which
> calls dev_err_probe() when the resource does not exist. Every
> non-removable host without a third reg entry therefore logs an error
> at probe time and then works normally.
>
> The binding only describes the "host" and "cfg" ranges, so this is the
> case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
> where the SDIO host of the Wi-Fi module is non-removable, each boot
> prints:
>
>   sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)
>
> Look the resource up with platform_get_resource() first and map it only
> when it is present. Hosts that do have the range are mapped by the same
> two calls as before.
>
> Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers duri=
ng PM")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> Tested on a Raspberry Pi 500+ with v7.3-rc4: the message is gone, the
> SDIO card is detected as before and Wi-Fi works. Suspend/resume, the
> only user of these registers, was not tested.
>
>  drivers/mmc/host/sdhci-brcmstb.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-br=
cmstb.c
> index 1de2f05..7c17a3c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_device=
 *pdev)
>         struct sdhci_brcmstb_priv *priv;
>         u32 actual_clock_mhz;
>         struct sdhci_host *host;
> +       struct resource *boot_res;
>         struct clk *clk;
>         struct clk *base_clk =3D NULL;
>         int res;
> @@ -534,9 +535,13 @@ static int sdhci_brcmstb_probe(struct platform_devic=
e *pdev)
>
>         /* map non-standard BOOT registers if present */
>         if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
> -               priv->boot_regs =3D devm_platform_get_and_ioremap_resourc=
e(pdev, 2, NULL);
> -               if (IS_ERR(priv->boot_regs))
> -                       priv->boot_regs =3D NULL;
> +               boot_res =3D platform_get_resource(pdev, IORESOURCE_MEM, =
2);
> +               if (boot_res) {
> +                       priv->boot_regs =3D devm_ioremap_resource(&pdev->=
dev,
> +                                                               boot_res)=
;
> +                       if (IS_ERR(priv->boot_regs))
> +                               priv->boot_regs =3D NULL;
> +               }
>         }
>
>         /*
>
> base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

