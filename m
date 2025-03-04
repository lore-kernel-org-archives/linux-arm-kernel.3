Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCACC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXKlt0Ty81koEkznczHaUg06b2+BHYD8nOx3yCJc8QA=; b=hPOACoTJt1Kf0S/ScyJOGBEm8L
	btxxIa//1YW8RMlA859mRNzsXrglyHhenwPZXpvQ1CUHWiz1VNrvpbYjO5d9asgbUUIw6PW8TwnP8
	eDAYluP7Fh4ZjtjZxUP/hbkdbnYC/d2rrlffhR69MSH6hC9tcA/MSihytM5YVAsZHNR+C34ZwEdnK
	ZkqWa5b8JoAYux/84iF5aiKWKM5UGZZH+2QVFiy7NAjMap+AYp4C2R5cJg08KK4ikA3dife42Z9X6
	GiUbkXn5CiQHROAiu6/xVe2wl4yAs+C1DFcjcjLfysZXjMtwO/lrbeAkeqGymCtZqvvC7FDxxKWVr
	60KsOg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRCk-00000004bYk-2MQl;
	Tue, 04 Mar 2025 12:16:58 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR43-00000004WUn-3TO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741090079; x=1772626079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MZy0VWiaiUcAOLUZr1EitCj53YlBljkRvHR7tDzANe4=;
  b=Af4NCIqZmOiYOX9pSYZj2rRfOYRmwUi58h0ILZJ4O+o6AuWL985VSzAz
   1P+V5JNwOCaMDpkgKP3lkrPyuw+6Ln9Z1rot1cW55YYf0lt7DaUA4bm0y
   +gChz3FKug3pJfaW6B5wJIwkkAivgbXoAfJU7OyjLQ/rqv42kX8cmgVFp
   jYb1Z7vm/6OCzbzbYbE8bzb8FnSImUiaVK8bWmUA261d+vD3jnohIB4/s
   rG418SM79H7Q6OqxruZrprpwjDLU0pCzCcTiyJXPlagiLbZD/3KbQmT2a
   EbT1gnTTZ3qtLkj8Hzpe+nA2hDMT+Npprc5LqiO3pYRP3lWglRmLLjuIY
   Q==;
X-CSE-ConnectionGUID: T7XULhAYS7eO8P5dDIcmbA==
X-CSE-MsgGUID: bihkYuK8SAGl4xZmum9Nzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45930046"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="45930046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:07:52 -0800
X-CSE-ConnectionGUID: LzJzP827Tnuswzqwqylwxg==
X-CSE-MsgGUID: 40ygOT6kTlyfDKAMKfgDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118352213"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:07:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpR3n-0000000H7I7-1M7c;
	Tue, 04 Mar 2025 14:07:43 +0200
Date: Tue, 4 Mar 2025 14:07:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z8btDzggD29xtaAo@smile.fi.intel.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
 <e71c63c2f61135f9a8c7884525aab2c48f1e84c2.1740993491.git.mazziesaccount@gmail.com>
 <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMknhBGQaqFZJsPAoauZL4S5MYtN05EOQ-BO2vw5gH+Z2RLOhw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040759_876409_DB4619DF 
X-CRM114-Status: GOOD (  15.21  )
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

On Tue, Mar 04, 2025 at 10:25:03AM +0100, David Lechner wrote:
> On Mon, Mar 3, 2025 at 12:32 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:

...

> There are some different opinions on this, but on the last patch I did
> introducing a new namespace,

> the consensus

Hmm... I may not call that "the consensus"...

> seems to be that putting
> the MODULE_IMPORT_NS() in the header file was convenient so that users
> of the API don't have to remember to both include the header and add
> the import macro.

Which I am against because it will diminish the point of prevention of
the APIs abuse along with a potential to have the stale headers in
the file when the code is moved somewhere else..

So, please do not do that. We have only two abusers currently:
the PWM and SPI OFFLOAD.

-- 
With Best Regards,
Andy Shevchenko



