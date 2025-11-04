Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E32CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4zCt5QoOS9IOrblA5GDQS3u452zsqx0smmOgpfMAp0=; b=N0A0PvJc8g5gGnObaD4e7CcaAz
	bJGmlGYLzBRbtYR3gqBpAVi8lnl8KYKVsjUqsaASr8oie5HkpXUFGgYKNh/8NsDhVxLfYXXH1aJjb
	b79RbQb6pk7h/ZwqTDq/3FfDcN8HqIQ89IvgcnfbYF/QLkq/J7XE90/pybsXiBfttW35kqxo6qYnF
	MDzHIKwmvE91wjdVTddlFUjLksTKv5EK4GzBxY6GFivDX3Rrb7GDpbBMOzxBrxCgTCKMtfV6PNXJh
	ewjer+xR2HbUwAquHeLzhlKZhPbp1nLvFB/KjYgADMAvy1jee7+VlcmylG9m+AoEtXdgwR5J/OGQ8
	NUUmayKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE2D-0000000BaqU-2wAl;
	Tue, 04 Nov 2025 10:13:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE2B-0000000Baq2-1PZ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A65D40681;
	Tue,  4 Nov 2025 10:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DDAC4CEF7;
	Tue,  4 Nov 2025 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762251182;
	bh=icqyozgXuJp3TFyBwx6Aw0nfD5vxd8pkStCNlIhPD0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuNKL8DgiuWqZRNbOeP0J8D6oiYE8NmQg6mxYwpn9jb1acj/P5hvg8b8HqNzTLoEb
	 OWYb874u2QM9b3GYVsCPiWArerXQ5Ts/9+6jw1l3xkx6VcjHrEyGWN48PFRaGm8UYA
	 +WyQg4m0J+XB6skEnw6SOAj5glof0emhU3w0B3XwmeuzHxtwpoe+8XBH4b3N+v1zfs
	 uZ/wEf5Wnvxv9vc4n1LK6SEDtge3Tkgl+3my8HidKuqNij8V+VhD3aoOiogdJ2OIOj
	 7OebDqwQwa7dBTuMXN+Qm/rGpcK4nerGjfmfX5gAJTrcvX2i5p4UacfgkFE1OB91uU
	 RgIEOnuUPxSfQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGE2D-000000006G3-1Ycg;
	Tue, 04 Nov 2025 11:13:05 +0100
Date: Tue, 4 Nov 2025 11:13:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx8-isi: Drop unused module alias
Message-ID: <aQnRsVPq1ndQrLr_@hovoldconsulting.com>
References: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_021303_394510_0228BA9E 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Laurent,

On Mon, Nov 03, 2025 at 01:44:38AM +0200, Laurent Pinchart wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.

The commit message needs some more work since this isn't a platform
module alias (i.e. has a "platform:" prefix), and judging from a quick
look it seems like the driver did support platform probing before commit
605b57c4e888 ("media: nxp: imx8-isi: Drop partial support for i.MX8QM
and i.MX8QXP"), at least in theory.

It's probably fine to remove the "ISI" alias, but it should not affect
module autoloading.
 
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Johan, I've got the idea from similar patches you submitted for other
> NXP media drivers, hence the Suggested-by tag. Please let me know if I
> can keep it.

Sure, please do.

> -MODULE_ALIAS("ISI");

Johan

