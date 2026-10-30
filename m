Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wPiUr2BW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CsSXa91d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jaGHh0Aw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=; b=wPiUr2BWXyrbtQ
	6k8EHNzE9cCHm5WeSUadTXdfYHucMxo02yxZN7EI0XsOybY8DucO3BPfgIkzsUwv8Y9Ht/ZxmNqfy
	86y/evQ3Eq52NK7Wui4ULqZKeQv9SWTGCPGkUp0HfMPhbMSh8TAc4/C6UTsp8iCNLf88KZOlO+5fq
	7w70FmpQm3aSfp19r8Gidh25Rbo9L2E92jvonKEg/i/l3wE/5aRxns5AEUnUemfydA2we274WLuiW
	bc76c/kBYCDryWsP5tyv3UyQUSa3qqYKf1Pk0xksetu5IkO0JoFFv0VU3/st8xgsiex3TEKWDtPPa
	5kFku2JSLICknEjQptKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLj-0000000BULP-0tdx;
	Fri, 30 Oct 2026 11:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkLc-0000000BUIW-1Qbp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:00:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9cY2374177
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=; b=CsSXa91dpCxyvxj2
	fCDh+DquoMmfC9cuMNT/c2dEpu9g9t17dZ844GpG1h05rpsfBunpcqRv54iiI3u6
	NimFHerF9cplX8hzp6E8RWHuhHbhNoctgXBUz/gvZlyPI3yJnM3LVnhUhW/mNKTb
	XdCDTW8g+hBvmixKT/Y7gE+BIWyUwJVumOujq/s2ALGLz+Obu5SsGdTVuOkeKRMK
	wCSfuQFpo/6F2wHBo43dPJRrt6dsHc54spYvVpjnMprPB6FjEo2PQLhzHPPhxZ8E
	zIOaKP7y6mhOEwmZ9t6cfcVU4XhrIcIKugPgBVeSVUqTjLoVHZXzYQiO2dCT2Jq9
	ZVVeXQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjkas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 11:00:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so421441b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358034; cv=none;
        d=google.com; s=arc-20260327;
        b=pwlT/Bh3PMWSbz+73TplkhTNC0NOCcId42fhWpaEfXEd7jBRId+tHIF/34ZWR+M76N
         cu/VdjnLJlNedtjoH70j/IuEYal7SaG6OcbSywmajsl/5p+UdNw6GqN2y+Y4RsQst9Ql
         EDEn6BNEQU7r/dxEdxWqUXhyhFvMm77qOoeDednYUjmMB/BZCT7ziju9OUIS8SO5dvk9
         d+tbiOJ8/Nqk6dLOT8AiQsDFUlx9tX8Q+HoVY2XLcXVsqh83VonwhdHCcAc5U6NV+45c
         IWh0n+/Qt282TeReB4LjQDqWtMzqDxN2ZUOUNJRRw6meKjh+GWcSUoDlv/QZZjxQcopy
         plqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        fh=h0zXMMaGzSS1XeEdTI6tyD56GPukigGr9FP9vhq6zRg=;
        b=kcJEgIZXuSTtLcU0CFWMFdNAWHU/oyWsNr6EPNB55hFMO8UiaoS6ujunY3x3rDD0p1
         1qtaJ++MQu2ug5MPi86vK8VnJH0P0zbBnktuNfmb/AYyM9Pf3jF7QyntIoPkr8DROzAM
         aunddF9mrKtHsi1ZCgiK8yyGt5RCvHR2bjCsuqcL98IIffHNjbvg+ByT9Kf6MNlJQtSC
         82C5mSUL1CYT9R3EBhBDsKrthREYKfJbZlR1tK61f3V1GLOjR+BwxhO3BNfeWhBGE0l7
         ZJzVrgcReWzXFNO6NGoCrnRue1bHX424HY2xtCaPr4k5PakwzCpQ5sDvRonnVIW/04Y0
         xJDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358034; x=1793962834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        b=jaGHh0AwQWfPoXBGBcBbXHiPYnhSvphmFqpHyvAZwhkABBGTY7DA7Vk2OoIrr+uR2f
         T9rjfp7AYjmHrtyjVf5RAkPJMPwIOegpmzQOznqMjedffTNm3LsixNEfOCsn/XF+97Ro
         CodQo9H8vY5r9c/y/o6dNs4htIax0J8eOBqG+RZZxl7PQ8Ufmp6SBCbAp4aYEBosoHM6
         0t5Dx2Rf28Int5QA0C9hwla6x7HxnnuPjFvV5Yf6KUpkU5EV+g3oEojobvczsikQE0N1
         1wVZbpNFKH0X1m5/uLsR58HnaY1EevalvIxZ3acQx747QmtfPT0XL3kl1QIugKVFBiv1
         DqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358034; x=1793962834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcDbmSXB55pbh/pDj+0+0hVcgTy+254XVZ5pIx4rYQ0=;
        b=VFwGqf75oepFM+cQvl+dt14huB8MhLfQr24ZJ8DpkAP8i7+1EKDcUQGRFcl87vWDHN
         rvrzvF91ljeAbq8J5sRv8+gmRtB36iMvljKS7zjnsD6OHJvcj52JZXHX4mxJZ4zZZLd/
         CkPJDvEB++T+JutyqnN70xGqW0MWyyjxoskIMJlTfg/OpxjdSh/0R8Bl0IbSYdBbhDwf
         MfjHlWodQ3mqn6GIFsHqJi7QIYCe+lI5xgJ5qfdYcmkH2hLjTQkJpedXb7Iq192d+o3G
         zUsLuFCvYzkg1IR4nr24kzJe8THvOMVj1MLw0/RXl21egkIK2+E2Ik9zoru6ipFdoZip
         r+4w==
X-Forwarded-Encrypted: i=1; AKwUvBzOZW+64QxXlwL4NcuncYJVsX44ecgsuJj/6GKecCObdsX8R5cO/nUN9B76zyxfK3aNxQOG3saZKGgBAgEd1ou4@lists.infradead.org
X-Gm-Message-State: AFq9FYJnDAy+pBr8VHjm6w6JrsdwacxcGtPJBQ2V6E97af6D3DIOCS1R
	n8EXrrYcRU/AevwPLKtwvgSrFq8KPRBL9J4gJX/QziW7d8TxVT8NmdbEVjNe8Z+Mi/PfXOdfksh
	KvpMaityVnfbCWagHA9rWo0XxsGfRjilvGOBtvRg9wI72IaB5aDURyTQZ8msI9Q7Wosop1YwGbS
	3RaiubDeYhVElt33fcgDWaSut8w0Fnvmyq99HU8FuOBfk1g2V1wKLC2cVWBnRy
X-Gm-Gg: AYBFou1oa2WG0kWnLBb0WeS5Mo1kV2gIVtJYIYX3/2+qyDutWKIQYpAX0AdXHKxxHsc
	K/or+VEJzgihB4SbLu65nyb4mcA8rbrQ7/9nE5z/tVekRbwT0V0/OM1+fxL31/7tTrnvTxO7GpH
	k7RMNEt3tM6TnvPtHf6+HnXXGtZX/tQ7D07ZR+9OnnnmFivshzLYdidJqnrw==
X-Received: by 2002:a05:6a20:7343:b0:3e5:6c93:2500 with SMTP id adf61e73a8af0-3e9290799a3mr1931063637.57.1793358034434;
        Fri, 30 Oct 2026 04:00:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3e5:6c93:2500 with SMTP id
 adf61e73a8af0-3e9290799a3mr1931033637.57.1793358033943; Fri, 30 Oct 2026
 04:00:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019143317.2222236-1-bruceli20040604@gmail.com>
In-Reply-To: <20261019143317.2222236-1-bruceli20040604@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:00:22 +0100
X-Gm-Features: AclHuK-5lepEJ6hbXHm1qJZsM8pIJhTJ4sodowpFgQQ3XyT_SGsEkcNO1TTf7hU
Message-ID: <CAPx+jO8FYgO-p4kph+p8Y0M=qHz_We=k=eVYO=Smd5KJ26xVHw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: wmt-sdmmc: release DMA descriptors after stopping
 the host
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae478d3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=byypguvoXFTbGjyYA4UA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: z1RPkIA4YJkjG498J06J7rPi5eA-Gf4A
X-Proofpoint-GUID: z1RPkIA4YJkjG498J06J7rPi5eA-Gf4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX7F3jJVUfmC3p
 s7xBGUSS1WxUYyxZF4NrSx+/3xqHYwE4JzVAcE9RXaLwmSYNVJWn8ODBntnlthaWecjPni6/nyl
 2WUdMOIgn1BAxFOvRxBSO/yiWevJyYOej0pvfx3pPaITU7FIrnWMjzuHgtPNI04km8PVMI1rv2O
 dgHOMzZJR7m7o0RR7c7g0Evt779GCF7krarkRUUkkql19ewLw+ehab/YOA7lY6K0r+HUAMZBQ6x
 hrV8Q31zrJiE5C/cSqpFmaBI90kqzjW/zky7LX4Avhyw85HjHY+wdOpbjJ+bfi0c2TlIpkzqWrQ
 XEPxmi2K/0TXzSPdcNpDTugzCWHOGn136xp+FMHl25RTS3Ew4jtyhsy6M4+63e67+dlMStO5t1/
 rb5+LQk0QqTZYIkQSAa6/gU7c6S/U9srb4J17m+3415CnCg4R5SpwX7vtj4rBTPKJ0R+Xr/wTgM
 5MFiBcRtsfODP9xJTyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX2Ulfx64AMJF5
 sZZofbDDi6pNxYI9kpXTBbG6wVYTjh9EJw0OaIFOmDVyP7MlqHrpA++IXCx7l6N7sxGRM1tzshI
 aHhvlukcUBjgi5BPVdCXtZfoeMPnTdc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_040036_524769_DFE9E950 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, Oct 19, 2026 at 4:33=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> wmt_mci_remove() currently frees the DMA descriptor buffer before
> calling mmc_remove_host() and freeing the controller IRQs. The
> controller may still be using the descriptors, and an interrupt
> handler may still access them during this window.
>
> Stop the MMC host and free both IRQs before releasing the DMA
> buffer to prevent DMA or interrupt accesses to the freed memory
> during device removal.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Wrapped commit message lines to comply with the 72-column limit.
> - Moved the DMA buffer comment next to dma_free_coherent().
>
>  drivers/mmc/host/wmt-sdmmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 489daee4f4fc..55675aa8d08a 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -895,15 +895,15 @@ static void wmt_mci_remove(struct platform_device *=
pdev)
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS0);
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
>
> -       /* release the dma buffers */
> -       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> -                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> -
>         mmc_remove_host(mmc);
>
>         free_irq(priv->irq_regular, priv);
>         free_irq(priv->irq_dma, priv);
>
> +       /* release the dma buffers */
> +       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> +                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> +
>         iounmap(priv->sdmmc_base);
>
>         clk_disable_unprepare(priv->clk_sdmmc);
> --
> 2.43.0
>

