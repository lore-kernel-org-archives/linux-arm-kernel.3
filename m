Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED3FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GpHny0zl/NX43P1rE1rK7JYbAuIxiKAA5wXkNUKQcQ=; b=viaP24I346egDiJ3X9Lus7D672
	lap4Ub5mTweGOqJ2r3VUxkm8P53zQaSyvDsoFc6+mDqe5GRPLMFdzKnOoNfq8WKVUKSBwMqb/FVQV
	/OqnoFpTOGoscKbJwnmj1UMN6N85LcZ4lNyeaOrc6RK8ZFiQSTGLM2Kul9xjoyMngFcQy86olHa3P
	JLJKUYSJAiDCNTDB3xGeMURihWiQyvizfswSBsmy3xiTESRIZYCCoTq0Rc6TQ4qXv51/9spjqs6uo
	vQO7ltorOQZcWIvy7ZLiT03oRms/6tBan4fm+oajcz4lHsw/n8tQ8vRyQEL0o0Rz7XSPYALZK7Z6j
	O52zmU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1ch-0000000EYfH-1ZL3;
	Tue, 07 Jul 2026 08:57:47 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1cf-0000000EYeH-1M6d;
	Tue, 07 Jul 2026 08:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783414665; x=1814950665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nzWr+zPfWKM/sOnn7+GpGc3qIRS5XOpHk71PIjjVj9Y=;
  b=Dx9Cl83uoCqiYTlMQWzxG89XS5nVL2+WPBcmFgd6ZITv/2LGjEkRoxs5
   1p1eqot25v9KnJ6MH8B9Zx84nCxjFAZdob3Z6XbIVkPBySLTSfeEA7FIz
   o5wlJwiJFLWMYYcAIkHXoMX1eXL9/UdDUYfFbzVLbxcZvE3aYtejF9G20
   SwQgwpBnXsRlipV9mXIsPpQXPj9bxPoZYl52p4WBRyRPUOjjcA6WNb1X0
   814D/ey3rsh0djFYUYlt1INKqnfv/StpYLmTK3Jqoe1fVLKeswNP2qjmE
   kH63GDrn84a4m0Mw54pbvaNQmdPTPuY4MtKc0KcT9zEw2qxCleWLFNjaM
   A==;
X-CSE-ConnectionGUID: nuZzGxlUR4+mnIwPAFPe8w==
X-CSE-MsgGUID: Dc2ftYxCTdisJAKVEproAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95435785"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95435785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 01:57:44 -0700
X-CSE-ConnectionGUID: Pzzn2J57SJuLnF6vhw63MQ==
X-CSE-MsgGUID: a6exJdc3TFWbxjgJ3eud3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="249512925"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 01:57:41 -0700
Date: Tue, 7 Jul 2026 11:57:38 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Message-ID: <aky_guyAt5Ybtg6k@ashevche-desk.local>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com>
 <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
 <akyxXxtj8nyCs-yf@ashevche-desk.local>
 <CAMRc=MfD2j3xt1dXojFbyn=Df_9epMgEmLvSdCAfS7BSS6HD6w@mail.gmail.com>
 <1b84432e6d5f40ceb1597a75f2ecc652@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b84432e6d5f40ceb1597a75f2ecc652@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_015745_405041_86D42CF6 
X-CRM114-Status: GOOD (  13.98  )
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

On Tue, Jul 07, 2026 at 08:29:25AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Tue, 7 Jul 2026 09:57:19 +0200, "andriy.shevchenko@intel.com"
> > <andriy.shevchenko@intel.com> said:
> > > On Tue, Jul 07, 2026 at 12:24:16AM -0700, Bartosz Golaszewski wrote:
> > >> On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [林祐君]"
> > >> <eleanor.lin@realtek.com> said:
> > >> >> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:

[...]

> > > Would be just leading reverts in the series appropriate? Otherwise it
> > > will give a lot of additional work for peanuts.
> > 
> > Yes, that's alright. It will make the review easier. We can then squash the
> > reverts with the new patches when applying.
> 
> Understood, thanks!
> I'll add the revert as the first patch in the series.

Do as many reverts as patches, so it will be 1:1 reverts. This will reduce room
for mistake.

-- 
With Best Regards,
Andy Shevchenko



