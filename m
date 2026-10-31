Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56453606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBcCK7yC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FJvFxJvg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rme5INkT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=; b=qBcCK7yCkE3OtEeiCZE+b3oXsb
	u0utDN0IvfsDH6tfhgD2r9vHNGvMWe/TBjXBf87pLF748wd1bDSs1zYzAb6OwvqELpQV59o0o5exn
	UX6c1yzZUcx6PlO7OHKkXD4uFlBU/nuA6rZu1yjt5BsGRHhNc1KvEpzSx5Vg+kydWtqxGA6cRqBjX
	ZH+L+16oYKfk/S5UDrWVq33Gv6CiRYtgpWxDblYyB8UaqpAH1TP47uIGuHY1+AMd2LLiqCuJJKI98
	xDjRDEUg1cN+krUP8wCcumhJJbf+5iGkMg5motmJ/ayZqZ8JEqr97cuhQTE4Sa/0YHXopaFroVU3J
	eVg3AATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAzf-0000000DQw0-0L4H;
	Sat, 31 Oct 2026 15:27:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAzb-0000000DQut-3a3b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:27:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0BOJ1849057
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=; b=FJ
	vFxJvgYCstEvbDKYUxxz1B9BCgQ0xfgx/UEGaF1nIXCswS1rwnxg2MGi4LH9mC/z
	m0CNX+MrrlBxER6K9e5WE7YFVR9cU4n06eirW9IXTWyr1WFHRfuQmTguT2TwbH3n
	nhM+M/w8FkQrlv9aWpmXsP5h5wG+5lDPvwpU+Ly9sTZ588JDZKn+bkKKujwO2MY3
	gvDJoWlR6s8NwUwgmZdHpJ1vr++wRrHyUSoJAs7yW5rocMv+ZNdTHDP4T99XFnZk
	+JRc4j8CgPg9nqu36ovtuGDjuaU8DlNHOa7Qu3MQET/V8i6+Tb0v/jhTmy64kdAj
	7MO7z2UqRBPzaEBkf1xg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfsfqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:27:37 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-48296f34f1dso1492750fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460457; cv=none;
        d=google.com; s=arc-20260327;
        b=nxtgkNKWSq7Z7T9h59a4IRx4LA4/ggWUThq24wFUpeUYQjsmwPSDbNdbI3K0r+cx2+
         Z+A8rOcgMoT7Cv00XDGa0sDhZlSrZ0GMdaYjpyELzLQduNoJ1Wf0qcyXUjL4C00Mhbx5
         tVFJCFHpVNBUvGQg0Tvh/3R9F59Pa90USoSDBSlyryEOQfM/N+Y8bRQrCvGBr9FOBh7G
         2h9sMRp2tswSQGuNOXojXMLfqor+DCbFZ+sjJ7luyhyPNTzmLW9UZCvVwHu1s0rKDayz
         yXZekQZ/+9EakkqglkemHDZZUjl9XacZIBmFnZqQxsgo5vNoJPaQ5bm+THb2kFwzHiW8
         FGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        fh=VA4pOqsmdCB5DZcQQmQCYLOBtMRUVa5R3a8Ar1FRF1Q=;
        b=Qc2nXWUHydPZZ2BdSBRjR4sAUQXMxO5G4wSA+p7/nXAPIpufhFmygyivbDlCSQRITq
         AnF2JpQCuGEh9B3wg+CoxpGVs/pkikcAZ90ihmn0ihiOQLDItPl9znxyTqjUf9m3dXYw
         /wEAfhQkMdSwLRsutECf9xK6SCUuVxI5+hCA1BitI1EfZ/Q68sqmMFfRWezaogiqdEM0
         LCx785x0yqZQzsDWaeUWpig7ecTCdCIjNrGjdgu9N8cS6Yc5qMVmOn/W60NIRwAF2n00
         T4J3/+aA4vurMRkIz+CSXzX0ejTI1paR6bHzdWKbruRO5CI8ILVKvnJx3ST2g1Io6fAY
         T4BA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460457; x=1794065257; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=Rme5INkTz4jaerbBSJ/rkTok7sAt1XTJFqCDhqwlExkbq13T3jW9QQZLVAXgeo3i+M
         q/t1K+wO4pqYmzqj/TdYKjfsR23RRQlmyIpjbg7onFgFGi55IQf7u66GXzLQv6Owdliu
         Ee8sXW1juZeP/KqivLMMeWZ/Sx+wWTYdTQP42ErY3MsVfMVsfs1f1pwq9HiPtpTdUOuf
         7//JSBqSxrZUg1h88ZYTCvo6hChQLFCIdysNJFbRTE6VV+4KYTMq28ik5fLw+PRx2VcA
         vPFCoZeskgYOLynJMRUHO/Vo1uNryDD2jmPK9OXYDYnSUk9NUz6SpJMjaITN3sxiUYNx
         fKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460457; x=1794065257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbIGiHBiaKBjgOa8o+hDFP6aAnbPQE0+rh/Y8oaEe/8=;
        b=ptwXJI0r+zT23UldtzwsIIBLpXPITwhRhYw1Hi5qvRXxSdjEU4R7m7LdasqKy60Jps
         JQEx/1YM7vmPBaA6rm+qOlTi1qON1FHNGpqJG6B7qOuqzgKJmBieqp+MqQ9VkOJvcyh1
         N9L429pDhr7QPlc16ViMSSV+OFk6/p061FVD+v3qIQT8vf+hZT3ZUN9bDCunlZEwgGmj
         3Rf0ThMoCCdJvx1SuzttIlzbDStEgM20W5iIQq2GZp9yUf4NAw77x34kxLdaUSfxghwq
         djX74ULsHkBQKpawvRJ16ecPLqYmrtN/FWfYe1z3jBwEGir9rrPISFOatK4Z+OVS/KKi
         i1zA==
X-Forwarded-Encrypted: i=1; AKwUvBwPO03Fx7OuDLCU6qRQNq4hO1IQQe+anJTIF+quKbBE60TAUFcScPdTRT/zaUo/8MiYI7dSgtwfOyVOCUGrqSL2@lists.infradead.org
X-Gm-Message-State: AFq9FYLJMImWLTOmgOmesD94xTlcrHYp4wEdlMwKIQiCIx57+wwCOiP2
	KmRjXz3xc9R1qeBdyGb+yH9btrFMjUmftAUBmk5KCrSbQKSm3Sfs62/hkpwObGtJkzCHyu1hRNp
	U5NmbBVfemaVOd7wB2adA5+4J+W0W693H+NlKgO/H9fM1rrliwpVl/mLQLPlZMs/PEc4oz6dd8p
	SjvpuwkxtyAKzyTPJ36J0wiwAlQpb7uYCpYvRxZKIB1XysIBV59kpp
X-Gm-Gg: AYBFou0h/mMGqMWNcqfxL9jmVIrlvxGXp8kDSTc+9gycknkJ/UE1z6+an8KJ1oKaxag
	Az+Kz2pc+OEnSofbbwQxfx6vH1aZrKQEpJ6B6/MnyI6XU2hKc5KnFKCADAuawv33Z63ex9AnM9d
	onkFCvGksWIZ4Q78A3dpB92o8wRurjSmtN/9Fv88ii+UavIJKMrw7tULAOaw==
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id 586e51a60fabf-4a907684d6cmr3466583fac.33.1793460456911;
        Sat, 31 Oct 2026 08:27:36 -0700 (PDT)
X-Received: by 2002:a05:6870:82ab:b0:4a6:d85c:a3f2 with SMTP id
 586e51a60fabf-4a907684d6cmr3466570fac.33.1793460456464; Sat, 31 Oct 2026
 08:27:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:27:25 -0700
X-Gm-Features: AclHuK-pzJRTbh4UTFiq0fs-4bAqq6ic9ym9r9ejSwbktmESwt9yc0oaaUOjgyA
Message-ID: <CACSVV01pWNJsLLek+az=uHbt1-Cavv5M=QhX=xD6_AG9J+magw@mail.gmail.com>
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXyhyZJauvOfst
 0T6XuQXEkPvH1JYVak0yJQbpZYdhiHuRH3YlYzCL9uvWy/ksXdhZpn9FUQ0eZAkb+w137LUEy6J
 Xu92aDO0f8c29JZyIM/bxhQP4ObOHWU=
X-Proofpoint-GUID: ct3Cvr3zoZClj1rA34ORdT76JA4nVlsj
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae608e9 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=BFTSSJhH0xhXNpwrsgYA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: ct3Cvr3zoZClj1rA34ORdT76JA4nVlsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXwRKal4t7Ogf/
 f+L7MVokeDPJgqBzJJKYoFvYmcp9y+p+fNMEanMepbHkfl4K/bYiPVIk/do/5oTyZNzCctFnTg6
 in/4shggawA3q4wO50ZZCQtqpSayNmwUwmUhlF/Yjcou/Niif6d8uDkL9G9m224WnHiTQDdFNMx
 VWpdPoXM720Q1zrZFs1n46Lhsibv1oZUOIzWH7cB9wqdI8LeT4KLjfGAReIkdBNT84Lf45BKcDu
 qTFXu7pSJmJ13gXLHks0xXET92axsm9dkm4amo4sa507dMunc/iPKVL508mls/WC9nC+9s2F7eV
 lBDBagrUw7T+hOSYtZ6vDch8syFskAYPU2P547/sraFu2cqnAjjorB7DA8jCnyyJXjDiJ/fNuad
 05u4qTclHcDS0C5ZCU2Z5/CSpnpWXH8Ks5e2A14GZqG1vOREhHb/VKNHvsVVJg7IpE04ddUbZf9
 dxByldi9vvaHqO3YHKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_082740_015779_A283D72B 
X-CRM114-Status: GOOD (  19.99  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
>
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu=
_domain *domain)
>                 return;
>
>         pm_runtime_get_sync(qcom_domain->iommu->dev);
> -       qcom_iommu_tlb_sync(pgtable->cookie);
> +       qcom_iommu_tlb_inv_context(pgtable->cookie);
>         pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>                                   struct iommu_iotlb_gather *gather)
>  {
> -       qcom_iommu_flush_iotlb_all(domain);
> +       struct qcom_iommu_domain *qcom_domain =3D to_qcom_iommu_domain(do=
main);
> +       struct io_pgtable *pgtable =3D container_of(qcom_domain->pgtbl_op=
s,
> +                                                 struct io_pgtable, ops)=
;
> +       if (!qcom_domain->pgtbl_ops)
> +               return;
> +
> +       pm_runtime_get_sync(qcom_domain->iommu->dev);
> +       qcom_iommu_tlb_sync(pgtable->cookie);
> +       pm_runtime_put_sync(qcom_domain->iommu->dev);
>  }
>
>  static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
>
> --
> 2.47.3
>

