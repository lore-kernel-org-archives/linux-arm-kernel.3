Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F2AEFD20F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbuiIKVkAPOuDTirizvhEGsPkRAbXAkPZHZsKwKoZLU=; b=d5h6IYuI6zIaAh8izIgW6it0rU
	iCsB547fxYxsmVeciXKz9uP00J2zWa6IklxVdyHKyizGt5d7Tge63cQH1jB6vmDwEnvRVU/ryVs4n
	CWeFZqt4b6TSYfaMVW4SP7X/KRMPcIaj8ud0MQS/mliQW35aYw3Rx3Jlfk/jthn/36/GAkc94cKQt
	gKnN5dO/04cFYUsK1zPRJHbpAwkFNY/dvpHZpun8U9+gnYepTsCI7AJWUXtcMyQzRlo7rMjwkSkXR
	HhCNw4zACUpArMu0D2J3eRILZvF+wCkNUL2Uda/KuSB38wESE8l14BQYcy7Wa6e5OhcubXKzsMror
	94C18ekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAzm-00000003eEa-0T6U;
	Wed, 25 Feb 2026 09:15:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAzk-00000003eE5-0kaL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UbuiIKVkAPOuDTirizvhEGsPkRAbXAkPZHZsKwKoZLU=; b=aIJ3NCHygeUg6MZOKP/iBOl7iu
	9i+Ci3ElTX+LeXN9sY95/h++iBi44uhy8vn2rNRKK5OPO77MN9UdeICypHQXIzf37vJ7L8IYGLodd
	sXfh0dh0tPDIftToHXZQWnmlt76aoZkTQ4ulcpdmdPGnj6Z5L/JSl/cWYtV8pllSUFE1XVwpt+seN
	nr2/0Td0+yYsFDfjc3u4k/ArlLHSB750YCe1+ZDAP3g190IVocEPVAYBtHsOverwG6woLFTL41V3a
	hAIU6WfJX4CdnRx7DIekdzF1w9MHdH/CtR2vBMVN1idMMcugjwGDxiAsW6TbXLDUFfhU7s+Gho1OF
	MssfE1bA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33474)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvAza-000000006Iw-1lB8;
	Wed, 25 Feb 2026 09:15:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvAzY-000000000pS-2juC;
	Wed, 25 Feb 2026 09:15:36 +0000
Date: Wed, 25 Feb 2026 09:15:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: sparx5: clean up probe/remove init and
 deinit paths
Message-ID: <aZ69uEQHdhASe5dj@shell.armlinux.org.uk>
References: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_011548_221560_FD828174 
X-CRM114-Status: GOOD (  21.45  )
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

On Wed, Feb 25, 2026 at 10:05:23AM +0100, Daniel Machon wrote:
> This series refactors the sparx5 init and deinit code out of
> sparx5_start() and into probe(), adding proper per-subsystem cleanup
> labels and deinit functions.
> 
> Currently, the sparx5 driver initializes most subsystems inside
> sparx5_start(), which is called from probe(). This includes registering
> netdevs, starting worker threads for stats and MAC table polling,
> requesting PTP IRQs, and initializing VCAP. The function has grown to
> handle many unrelated subsystems, and has no granular error handling —
> it either succeeds entirely or returns an error, leaving cleanup to a
> single catch-all label in probe().
> 
> The remove() path has a similar problem: teardown is not structured as
> the reverse of initialization, and several subsystems lack proper deinit
> functions. For example, the stats workqueue has no corresponding
> cleanup, and the mact workqueue is destroyed without first cancelling
> its delayed work.
> 
> Refactor this by moving each init function out of sparx5_start() and
> into probe(), with a corresponding goto-based cleanup label. Add deinit
> functions for subsystems that allocate resources, to properly cancel
> work and destroy workqueues. Ensure that cleanup order in both error
> paths and remove() follows the reverse of initialization order. What
> remains in sparx5_start() is only hardware register setup and FDMA/XTR
> initialization that does not require cleanup.
> 
> Before this series, most init functions live inside sparx5_start() with
> no individual cleanup:
> 
>   probe():
>     sparx5_start():              <- no granular error handling
>       sparx5_mact_init()
>       sparx_stats_init()           <- starts worker, no cleanup
>       mact_queue setup             <- no cancel on teardown
>       sparx5_register_netdevs()
>       sparx5_register_notifier_blocks()
>       sparx5_vcap_init()
>     sparx5_ptp_init()
> 
>     probe() error path:
>       cleanup_ports:
>         sparx5_cleanup_ports()
>         destroy_workqueue(mact_queue)
> 
> After this series, probe() initializes subsystems in order with
> matching cleanup labels, and remove() tears down in reverse:
> 
> probe():
>     sparx5_ptp_init()
>     sparx5_vcap_init()
>     sparx5_mact_init()
>     sparx5_stats_init()
>     sparx5_register_netdevs()
>     sparx5_register_notifier_blocks()
>     sparx5_start()
> 
>   remove():
>     sparx5_unregister_notifier_blocks()
>     sparx5_unregister_netdevs()
>     sparx5_stats_deinit()
>     sparx5_mact_deinit()
>     sparx5_vcap_deinit()
>     sparx5_ptp_deinit()
>     sparx5_destroy_netdevs()
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Note that there is the general principle that drivers should not
"publish" themselves (aka register their netdevs and/or ptp) until
they have initialised enough so the facility that has been published
is functional.

That, in general, means that there should be very little initialisation
after the calls to register the netdevs and ptp.

It's fine if something gets published and then a later publication of
another interface fails, causing the first publication to be withdrawn,
that is pretty much unavoidable, but in such scenarios, one would want
to do as much of the initialisation that may fail before any
publication of any user interfaces.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

