Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602F5D75E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCIHdusfQUmUzmwiZTq/xXQVvBLG1xueohwyeD4v6CI=; b=qvSjLXroJPDC0iaA6yHaM6nT/+
	ektDsfwUYepB/vyw7iXqFtGT/u9xMJJh9zFU7pYFnm1LsaNCRNSvG6SWfb+1BpBDInYVzq+SVz3Xj
	87aYVUJnkr9BbBq4Gdd0+eMfZysgg6Y8QChTUf47UeQsNnMH30KjMxIE1Ldy560AT4PC177ESaffr
	dglie/Kp2o3LA7QNVj5lDiUdqAwe+zbxcJQFWun2fFbWSryX3hx1IMS/Gn8xixPujJwnXEFbk8LTN
	2Q1COtUookmxlZ1GeJvjRNNqk/Ed/pKOIUAAEKJ0OqN1Y0v6Y7lbbQDkyu35lZ8A5BQhtqwi9eLm3
	QjeO/5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvqA-00000004mIh-0WDo;
	Sat, 23 Nov 2024 19:30:46 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvpD-00000004mEN-3bCo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 19:29:49 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 470d06ed-a9d1-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:29:39 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:29:37 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/18] leds: switch to device_for_each_child_node_scoped()
Message-ID: <Z0ItIQWHOGL-GTi8@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_112948_043517_67664B8C 
X-CRM114-Status: GOOD (  19.30  )
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

Fri, Sep 27, 2024 at 01:20:51AM +0200, Javier Carrasco kirjoitti:
> This series switches from the device_for_each_child_node() macro to its
> scoped variant, which in general makes the code more robust if new early
> exits are added to the loops, because there is no need for explicit
> calls to fwnode_handle_put(). Depending on the complexity of the loop
> and its error handling, the code gets simplified and it gets easier to
> follow.
> 
> The non-scoped variant of the macro is error-prone, and it has been the
> source of multiple bugs where the child node refcount was not
> decremented accordingly in error paths within the loops. The first patch
> of this series is a good example, which fixes that kind of bug that is
> regularly found in node iterators.
> 
> The uses of device_for_each_child_node() with no early exits have been
> left untouched because their simpilicty justifies the non-scoped
> variant.
> 
> Note that the child node is now declared in the macro, and therefore the
> explicit declaration is no longer required.
> 
> The general functionality should not be affected by this modification.
> If functional changes are found, please report them back as errors.


Thank you for this series. It may now benefit from the next steps:

1) converting to return dev_err_probe() or dev_warn_probe() directly since
   the goto had been replaced by direct return, hence saving even more LoCs;

2) dropping or refactoring the complex conditions due to your nice series
   being applied.

I'll comment individually on some to show what I meant by the above.

-- 
With Best Regards,
Andy Shevchenko



