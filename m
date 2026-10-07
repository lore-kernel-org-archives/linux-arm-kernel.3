Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86A7CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naMvJAfcGvrFcLacfffBq4dCKTYyPBgJUQraZGSFLco=; b=Iwooz+G+Aq7sEZwXYvAGpyr68i
	N3ycMy2PLNQP9Nu0d2OgZjohx3LzY00IxA8Fs87ON5iHDGR+5xtMuNTxJbppkO+T/TJ/oTTzOsf9N
	YJU7DThYlkHypVVYnmTMIrNQ63nOoFEKUcjHL+uwU+AdVIKOVw4gOUFH8swZArfVKltAqE88Oh33v
	ur3SSaM0jFh3I/bSF2p/lCmf0tolPxAVcW/4ATY+A733hsFdeyxTjrF9kWQYW8SVWarla+PqDrTCi
	/R5NueRWG4FbhEFWoeKUDTDLCFw5HIrt/DJftcS6w17gMDbJ/6JY6bgCEC+fs0j+8Y+ItkM9lQRjv
	fuexpyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQT7-00000002PfQ-2mpn;
	Wed, 07 Oct 2026 12:09:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQT6-00000002PfB-12XS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5683D601FB;
	Wed,  7 Oct 2026 12:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D996B1F0089B;
	Wed,  7 Oct 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791374995;
	bh=naMvJAfcGvrFcLacfffBq4dCKTYyPBgJUQraZGSFLco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNcvca9Q/wslzLqGXs9/Wr32B94+T4l0oXh/GBzOzyzU6ufuYbSd8dRrrJDarwLon
	 Sw4pCkESH+e4CjHt1QA0jaeBbHUpkzNLaC5JjcoprxCdlIHA/ov5N6R9JRqcFFAqUQ
	 B/S7w6uQaXvBpOkwAXmIkkQ1BeVrZvx1d1mHPaBXYTNJMiljpYc+wb+eQW61CjLdZX
	 uFZsK7xVo3OxA8kZvlee7IivCIok3zmTt9ZF9Kv3gEfglvWbnodgu6oP/lFRZuQ4e4
	 QIK+oSCJur2ivHX9cOoFq197zNireI3ZWAsB2BW9G9Z1LGdIO+iQBxUrihJJpgqx9x
	 hIhGTEeh/L5iA==
Message-ID: <sashiko-outbox-162979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/11] sframe: Add debug helpers with object name
To: "Catalin Marinas" <catalin.marinas@arm.com>, "Jiri Kosina" <jikos@kernel.org>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Indu Bhagat" <ibhagatgnu@gmail.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Weinan Liu" <wnliu@google.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Dylan Hatch" <dylanbhatch@google.com>, "Roman
 Gushchin" <roman.gushchin@linux.dev>, "Jens Remus" <jremus@linux.ibm.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, "Randy
 Dunlap" <rdunlap@infradead.org>, linux-toolchains@vger.kernel.org, "Puranjay
 Mohan" <puranjay@kernel.org>, "Prasanna Kumar T S M" <ptsm@linux.microsoft.com>, "Song
 Liu" <song@kernel.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, joe.lawrence@redhat.com, "Mostafa
 Saleh" <smostafa@google.com>
In-Reply-To: <20261007114335.440322-8-dylanbhatch@google.com>
References: <20261007114335.440322-1-dylanbhatch@google.com>
 <20261007114335.440322-8-dylanbhatch@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:09:53 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing <linux/module.h> in sframe_debug.h
--

commit 586ddaf5514eed589ba4352e7a7684af607fdccf
Author: Dylan Hatch <dylanbhatch@google.com>

sframe: Add debug helpers with object name

This commit adds debug helpers that include the object name, formatting
messages with either the module name or vmlinux for kernel SFrame sections.

> diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
> new file mode 100644
> index 0000000000000..f0bc2136eaad0
> --- /dev/null
> +++ b/kernel/unwind/sframe_debug.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _SFRAME_DEBUG_H
> +#define _SFRAME_DEBUG_H
> +
> +#include <linux/sframe.h>
> +#include "sframe.h"
> +
> +#ifdef CONFIG_MODULES
> +
> +#define objname(sec) ((sec) =3D=3D &kernel_sfsec					\
> +		     ? "vmlinux"						\
> +		     : container_of((sec), struct module, sframe_sec)->name)

[Severity: Low]
Does this header need to include <linux/module.h> and <linux/stddef.h>?

The objname macro uses container_of and struct module, but the required
headers are not explicitly included. Any future C file including
sframe_debug.h directly without first including <linux/module.h> will fail
to compile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007114335.4403=
22-1-dylanbhatch@google.com?part=3D7

