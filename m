Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3276C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEenGUm5RioXWNnfd2RzwGu/SqP7QkoWXITZGeqYw+o=; b=vOG/Y/rkuBFAXpWIld2YrpSkGU
	wXgdNcHP7d+5FONQGf0K+MROvM/qf/DyVm4nWej346h0sdKNBpoU/H+zm6GgKORItD98q8BO4QBWX
	8v1OxRWajzDhJEsE29I1jNNFFv2psrkNxqn5JetrHhaNR3wFe250mM13WYbxPoqcv444KrOhTI0SX
	XdqWMRD34RyhW9Erqy/GRwJ6uRz2Eoqj1md/Hj7uxqYAA474xK9+k+stTWRT/foox8kCu2HOg2vww
	MF+xIYJWD4EYpfT8IXzB/wCDLEb/xvHv2RxcupCCyxow7RwWjTkp279eiSepwu1mqlE+7GzZ6yO+v
	cD5FrcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJZh-00000002anB-1ZxE;
	Mon, 27 Jul 2026 11:32:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJZf-00000002amK-0Ee6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:32:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2526938b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151966; x=1785756766; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEenGUm5RioXWNnfd2RzwGu/SqP7QkoWXITZGeqYw+o=;
        b=Bt280v47lu0wQ56bn48GBVrPeOZT6gcMPUk3nFWy5o4MnufwvjIrjKqFsrhM30uUio
         Szmz3Q54KXKbit25QOkN/F4iYG9C2Bgn6JpY8ahXPgtPvic4yUd1KsRzo8UG6/fnM5XA
         u5lmt4nVZRHLrL6Xd9EOhUcRz2uWTR+7dV5CgoGFyRKJDJPay9YJP9sTgCMcotUkvkls
         X9ESP7122IO+cY/x1JQp6Ufd17lImx21SyU59vP7cHmPLfqSTQcG7GCs2R4UpCCi3UeI
         1FHED9NywzAiHLNdS4UE6G/CLHS7a20Fc0ai4tl4+/R0NqiXcM4lUzKvODz8/w1OZFEA
         q3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151966; x=1785756766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEenGUm5RioXWNnfd2RzwGu/SqP7QkoWXITZGeqYw+o=;
        b=WhK/ngHaho71sBSW0tSMLq1ilfFexd+c0fbx79RqkERFBkK2kuB3iWOyD67ENlC2/J
         oDAM+RxHG3rgLVVbaSGxXCXOjJBpfXnIkkozcjHULkm4EQ1N3RsqFIlDwTs/01R/9/XV
         5beFPvSLyBk8dx/vtf7dtedzqUM4mhDidMmANIUBclwZk+urALsQfBzbK/U+Ch66h1wB
         hwnxWZXP1C13ipp2z+a8jNnHVEXzCCTdb7giHH6xA/h7ox/kAnyCUuSEtNGsAE632a+y
         jOsbJ3+fB/6vj2zFN/BqjIzJ/MkWsVfU1iUs6JxaH0KFLwS/ElSqkhwPSM3C0Swt9ZPX
         dpQg==
X-Gm-Message-State: AOJu0YxjqgrE9L18JOrM0NKgfZVpkktlniNTVhlqF79Ecssy+g572G8L
	W9Sqa/wNMWFKKqoJIl9v0WzVDlL7seW4876RwwtcGJyitoGhivS5RyNE
X-Gm-Gg: AR+sD13WMOtWFg2ta0xqBqYBMCTuh+q94atRatDNisza3Uz7uDzjMvYe8Jg1fBeYyR/
	woUd2J5vNJhjPt2CcX3ouYXi3FRnz8/BvPyJVAkl4cdT1P9Y0I6ZE9sg8b2YMWN9bDkLG5M2urh
	NzqDHO/dNForHzC026TULthGsg+qXWdqR1dLH0cDddkkrtQsrUpbsqlyMR6OG0u91/f6VPBX29h
	vTskSRl3ve0dkilA1pTtJTLpTpQD1wpobhIbiGJlfZAxBMQLYAgJqznkMBUx07hMxqDye62HpPN
	Tb00eaTcddAOvvPRAbui8CNnNmmf1dqeQAcFU+4OvLhTGWf6TB/g60T5xYSOJQB5f+NVPgmkVm7
	3uZxruYHrX0p5LJU5Is6Ucxq6L5dPYebNxixFhOX2cyRr/5c+lF0wLmRbYpyXvhhIqcZf5fXNOI
	0MmS/41d8=
X-Received: by 2002:a05:6a00:f03:b0:848:469b:3d19 with SMTP id d2e1a72fcca58-84e59462fcemr6582221b3a.29.1785151966109;
        Mon, 27 Jul 2026 04:32:46 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53253d70sm2900157b3a.2.2026.07.27.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:32:45 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:32:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <chleroy@kernel.org>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: fsl: dpio: Use scope-based resource
 management in dpaa2_io_create()
Message-ID: <amdB2K43gRBDhBPI@stanley.mountain>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <f47abd6e-9337-404c-a24f-39a9dd7454d2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47abd6e-9337-404c-a24f-39a9dd7454d2@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_043247_100236_DAD3EE1C 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 06, 2026 at 12:40:09PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 11:18:39 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Omit two kfree() calls accordingly.
> 
> * Reduce the scopes for the local variables “obj”
>   and “qman_256_cycles_per_ns”.

Why?  No one does this except bcachefs and that was removed.

regards,
dan carpenter



