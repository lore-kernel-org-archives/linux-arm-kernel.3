Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA6A606D802
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7cxKHjm;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Ma+/RZzQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=; b=v7cxKHjmsgVCSEXb5vgEzyuvAX
	MWzUxSykwhzRuF9jnCsrVXoKCqk71qVov9gGyyMwfg0wKJ6xdmgW6AJByBR+k2vHUACUKpfzkXuv0
	gy1QX1ne6ARM8hw7a6/jxdRBKvjYYwq2lnXcMc2E+YYaiVL9DhRlALi1ATPp+ueCZc0PPt2xjQ4JA
	lxpHqFjPNRJofDTWjxCH/wLs1z2NqEjaGcIM4xSFlRvNNmA+7TuHpcbJuw/11v4+GDoFL2Ff0q3FP
	gPrk+gP9dKtD94CrWwOkzvngAQug2y/4cOuP2vs/o/93/lZVnaLL8U0nOugY8S2cex9L+byeBEfmA
	P2yXLUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL2D-0000000Cgku-0lA5;
	Fri, 06 Nov 2026 14:35:17 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL28-0000000CgjK-2cTv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:35:16 +0000
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DceuI3017565
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=AgxbqOaoVM9+7Pj0+8CQw7G3Iaiu
	Cjj7kRy0IPi5eVg=; b=Ma+/RZzQRAikshvpTwR1Eb4FzE9gsBtnnc5LGsWWCojA
	AZBj2PdwgHcwxlq9AD6KjiX1dJ6otI/lgVtK7TMCP/zaJAE2lhFayZbmAfgmLPt5
	QsBoDuhurAzVoZRIaGDQJRkuUX0wYVDr4HDPlJyadIGYaWUH7PVjUPyd2k1URpig
	eymuvPUPbXpWjkZs5IGZlLVwePmBqAqRT4GG1FN9yFOMBpvx/KIYkZZW9mNbSPwG
	ZettMPQWsQeSk3oL5NOxwAjcDI9WVmStSr4smwpckP6Tjg+C/mPR4NgcI6uTWXVH
	SNYmQm8Nkx0cVvB3CE38ko6Rgzr7SVDg7CFcI54aJg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3peuekc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:35:11 -0500 (EST)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b320a98b7eso11977977b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:35:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975710; cv=none;
        d=google.com; s=arc-20260327;
        b=KCjoZ5/69I2uEiIoncjSXWCSKOVCi8dfUCtalaBs+8lp6k4T+pnJgR8Ldhgnv3XTS/
         aPG27EOMx3PFjsf4EJq3i0RtuzdFsU99aJAl8aYGHuyrXpMzbo7mpvpo/z1ZlK85oJwb
         XNlnb6ihMDJi+q9RHqrv/nGaK5/h6GFyfbOiEZ/eF7ryPJkxnbfXymOpzj/e4v16lpRG
         XicckUXWQOA9UZEgW6U+gBKLzQKz8YB2qK6nNdiNW/+erb+FElkSB5q6qPuHDxhol6gb
         HNPXmOHDnckkXs7bVbi3Pwk9ko3HbPIrB+Nv6nrWN+2YfDAwj3MuHa097JkpcrecE+dc
         pviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=;
        fh=iN3PSSVDLsCAdyVfD0E1M2bRMwcPqsj4DiofQeqzkd8=;
        b=d3+02TKef83bVbev62AJ9glXKGy2xGd/o/nYaOtFVSr4fsWSwjmETSCSbF/sCpB7M1
         meVVQaL+hdltBK9IYjlGrDG4E7RhtA96RXSvl03js8GsaVUm4gera4fHY0s60PpBu88O
         yCnNFx6SOIXFU7bvhJRfbCjLhIf/6hUO19rIiTHFoz0HtupUbNxr4mvf1QV7vSAxSYO8
         336RzjRsM510ya2HsVcWZrkODH+70KP9VQjtVbtQgEU8kFyiZWxTEJSj/AAlfAhzwbgM
         DTlzwqxdioWQHpeIe3Jo+5k/oultbqlNijCnv1ZFPsFqssAeUcg2kDo2ukoTQRE9pR1h
         Rfag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975710; x=1794580510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AgxbqOaoVM9+7Pj0+8CQw7G3IaiuCjj7kRy0IPi5eVg=;
        b=iCNWusK4/fEJRC5SsgE73DBjCYFaL20rT8CsOG3zLdfyxBfwrcJUKN67z9yH0eaaOi
         tXq8lzlkfrQCl1/n+MRHQkIU3u+X+n7hhgd44VdQLK69RKo+rNUca6461CZ3nCgWtu1E
         51/sHi/BUV05raaqikLhv3v7ilsKA0xy/gBm6B/GrAqA1uceJ0P2g68IKeB2IJGfJax8
         N04lPTAdqvnr91HMwf5GxHT6P7vPz55rZnDIyfPvTUi1MeMYb4LWr38ooDKsZ3m2HUqw
         24sflR+TQAqtsr1qZitIGk+El8L7vxpkJ6GglrCY0M1rM9v7vIRVX6J+rGMYFowPuQTy
         MARQ==
X-Forwarded-Encrypted: i=1; AL+hErHz6NKRdwHduzujU1hSo45WJ6h9fAtuXC10yjEefSwK5ZSlpN0yso34J3WvvnGO6abbFc37UMEev7jgRlcikdJ/@lists.infradead.org
X-Gm-Message-State: APuU4Z+4gFlgP79tg7lDcBb0moq0JHyP/Btoa3WcSb/Oit6UWJCXHFjN
	kOxTNvKoZCOz5wzkid3Hufss3waE6BAFSCkd6mEXjuPUwi9OmJ/m1jHqaYqEyNdCeY7A+QFTW2O
	kFxmV15+UxQNA4I9n76El7BN9/absAZc722bfD2HT+fZKojLXB9CmqaoZSGvFVHcbOafz2r8Mev
	lFaa19hmfHE8B73vw8V1kDMclcvezFcae5Cs3uYsnrRprhaC0=
X-Gm-Gg: AYBFou1mxcLIstGGWeGn3H0RMVzy/bCfHrLSLaqrLMYHO+e5LgEsWxr0OBG1Gkm8Jhz
	lkd73QVaeYMNFFyxKp+HO7/vgP9veTSUkJQpgyYZ/Ln/sBK1frxwFDpgJ//ecjHA4FGoEhJteuG
	9uEWOXp6RzchC6wSnnJrvKAmTbvTISOiAf89JCOSTa6q+yoddgKpO0UMVzJhrT/8SuaSHvBr2Bs
	LXM1vIOBTo4kDVMQNx3+tuH+2mN+e/WKPgt7dJvprlpwG6cE1ZI4JJZTYoGe1TIOxGU+DR9dw7Z
	gq9YoX1ghsHAtI6MDA1y3nJIQirXekvQCA==
X-Received: by 2002:a05:690c:dc3:b0:8b0:d027:c4f0 with SMTP id 00721157ae682-8b3417cfa5fmr14408537b3.1.1793975710484;
        Fri, 06 Nov 2026 06:35:10 -0800 (PST)
X-Received: by 2002:a05:690c:dc3:b0:8b0:d027:c4f0 with SMTP id
 00721157ae682-8b3417cfa5fmr14408337b3.1.1793975709944; Fri, 06 Nov 2026
 06:35:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-pin-barrier-v1-1-04ebf118175a@cs.columbia.edu> <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
In-Reply-To: <CA+EHjTxoNcx4s4L2DRXLu6VydiG2N3OqRYr+kscghp0jVVwg5g@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 14:34:58 +0000
X-Gm-Features: AclHuK9bdlU0f_EKHjmsScSdj7QwMgpM5fQzjjzMWksK2dalOcvjFLTPsgJNF-I
Message-ID: <CAPOPQMDYJ7rEHd0W6Re4fs2u3FVf_Qs=5wD_U8DDOccHwaSY3g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Order a later pinner's accesses after the hyp mapping
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: hmktmqaYsmFr4LxYGbbIjXBUL5qDltaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX9F/p3oMlCaGf
 2PVpPkL+Y6AbezcVsYm/j8VApLLtN6I4bCHHjVzut9VTD5yj3Qi9jC8BKz4u/OZ0YK4Z3urtiSS
 YOCMouIFfQBFyfe5e5QCHELKBoh1S0qNOTlMAmqJlHOFtAWcLuLXNc0cL970S1F01TfZSD/b1Os
 jgb2uZ0ezuBX6fl9qTIRwH1JqB7q8FcgsdSyzyJDAyKGQzxpQUuOWpUyczs3SwvnMDObBmgq2x4
 6rfg9mQAf/0I/P77ixhlZlMnRHTMK5g7UFbqm5mi9PWmbGWD40JeXgG8UoScMOAFYMfJoHHTfhA
 XOitgAev+spvQ480mBNG7ezcw5LhkxE8EpkOAuLNhskYzygUcqhBXMosjR9AJdiZOm+BNR+d8Vm
 5U0x5A5cmRtW2mUzAmAxu4bHCQrb94nIJzdpXlUbIL94fdvP5GcRPORYSgyjCG9QquDbjvXVKBj
 8OP2vs+JUCYYbx92w4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfXyt0rniqfH0Hv
 z/F5u5eeIFtLyFDhIK+t5XYa9KLBKK6phTOC/4ccAtGcHFyfamUVIQNjFPAzML9zRUI9A1Gilvr
 K0weekKRgaCUVe7PTcd+NHVcmm0JZNz3e0/gdpgkIxyuiYFxmo9r
X-Proofpoint-GUID: hmktmqaYsmFr4LxYGbbIjXBUL5qDltaG
X-Authority-Analysis: v=2.4 cv=c4E+0h9l c=1 sm=1 tr=0 ts=6aede59f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=SMIg8bpeATqOEtpUIEIA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 clxscore=1011 spamscore=0 suspectscore=0
 lowpriorityscore=10 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063513_344662_6C796F44 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On Fri, Nov 06, 2026 at 12:59:36PM +0000, Fuad Tabba wrote:
> Could you also give a case in the message that a well-behaved host can
> hit? Since 7.4, two vCPUs of one VM can pin struct kvm at the same
> time from the __kvm_adjust_pc hypercall (cf533b4d3630), which then
> reads it on a CPU with MTE.
>
> Either way:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks for the review. I'll add the __kvm_adjust_pc case in v2: two
vCPUs of one VM pinning struct kvm at the same time, then reading it
on a CPU with MTE.

Thanks,
Xuheng

