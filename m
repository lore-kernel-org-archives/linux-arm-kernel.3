Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE6EE9A747
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dwLmUFC9jAYoqBGf2wujV4kmn3knCoiNZYrzuQW+1Q=; b=mhKARtaNajbGEKpKNd5yALfdbR
	s056+5z5TG8XplGyTDaK7j+/FwYxIFUriA/Th6c7bQeIIQAhybMQc+KhL2GjB0aCvnuSru9lwQWQy
	/KX0kkl+W1Ji6mM7CAZLmQoGo+tzbcRGBmK3jYeuc8S9zIO/OxuFqkhdUGqJehPx9Xu+bVkv7yRk4
	qewK9GGBvdcBXUIluZuxuEPmvvSmkgaA4j+jO9gcARPfL5/Ds1/sR7l1IeAyhX38pdxyYOFRgZvPP
	4F3ZtY/VLc82go5hFEkS3Qlh7ZKArhqrgWr6y/XejAOiAUS24Px+0HREjsBzZR7chjup78gVK1vVk
	SA4j6/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4y1o-000000015jf-4Ai8;
	Tue, 24 Mar 2026 09:26:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4y1m-000000015jM-3BiM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 867F44017A;
	Tue, 24 Mar 2026 09:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC89C19424;
	Tue, 24 Mar 2026 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774344380;
	bh=4kWn0YZJb4i01Ir/4InQFgfX4Z1CwGSc0CpGCKJSBVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgbZ5flOMOM0DOOaoa9asHdHwqPMbkAPF/BFyPi6SGFqxqv6LvKJRLnYf/1/cmxSM
	 GJq9ASMBuGA+274txopcYntJZ9cJ8uB0/dHPNqdl7xYFdE3LAsQlRtHyv7SsYddSgq
	 dRzSrxTc2MtnWiBtRov8cm8sNtXM8si3Q1vQkXtbUnsrrN9AYkarwHkK7Dpr4kdsEb
	 IBrewTBbkwRo9K1yLHOKHBjuun0ksO5BgNli5lh+UadJpc9NH06Gpvz5tHmc7Apxmi
	 uvvasKFHyuLzRTJnuLj+bqr14apLQwXmTd9afb6P1acgaSQrfYtWWoQ+UsEererpTx
	 vzNxi2GnGa5TQ==
Date: Tue, 24 Mar 2026 10:26:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear
 thermal sensor
Message-ID: <20260324-smoky-radical-hyrax-1274a9@quoll>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323133814.14152-3-krishnagopi487@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022622_822781_BFED749E 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> Running DTBS checks on st/spear1340-evb.dtb results in the following
> warning:
> 
> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml

How is it possible if there is no such file?

Did you just add new warning in patch #1 and then claim in patch #2 that
you fix it?

You completely miss the point why this change is needed: how could the
DTS work before? It could not. And that should be your justification for
the patch, with explanation why it could not work.

Best regards,
Krzysztof


