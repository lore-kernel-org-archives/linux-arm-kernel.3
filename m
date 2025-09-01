Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DECA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpD9WC+lIAWpalgfsw+H21gpTmX7hZzvp3NwJpCbAFg=; b=NzHuITDMgpae7/ioUiRa99jVlr
	c41DLudrqXoA4cbwXMLKya+MQnjREYMo1yWIOQ1KZ7ugaPw8lV/hN879ZAXIz4lUx18gJUls5BIRi
	C+cFpzmfl9Llf9gMTRtElJa39Uil0DLkfJYoTaD03aChlJ9c1ACs6AlwS3CQMZ1P3sOreUxN3djW0
	fSQQEi73RNMxRsh8vZNfGqK0ttA8F9XrhEE4eBy/lC8HbykHWnd4IQYRZQUUAG3/Eony2Qx9BHk+n
	yUK/hl93IAVi1k033XUmfKv90KIPKDyJ4jQwYKKkkKZpZRiGLrbAxth8VcXST4cIJVcZ24KLD9cAs
	Gyu5n6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh2-0000000EDxG-0aCT;
	Mon, 01 Sep 2025 23:12:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6j5-0000000DAIW-3Xil
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 15:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IpD9WC+lIAWpalgfsw+H21gpTmX7hZzvp3NwJpCbAFg=; b=GFMVSkMnXwpgL5AoL1o54Lx/Bl
	1LzUK2t5+XQLfZ18ihQXxC0+tYBVoqMpwIlLLEQSyZO5QK6O2zyYt1L8qfPxXahcoJKoc0/INsvwZ
	vUV+G3Ei2Gc27tieGrjg6ce5lJYetIEq82JaYkPLzvlHcFilKw97YCwkrZzrjCcju2SYRS6zg/5fg
	kpUvnW+mxsU8PcZwYkb/5CaTA/Fq1zjh3KInRCf6H4kh+DVi2tDXp3gjMHQDzNM8JGaL7Ls4Vf03q
	WQ5iZWtXY++tlQvE69eGRFfYSofDJ9AJHOQzFibdzWSdlXDkMnR+QOymcUmyJ7Z0TR2oHs6jSIPQX
	GEM0G6FA==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6j2-00000003nWP-0BBF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741544; x=1788277544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zxaxdww8toDhus2z2vp/yYJXW2OksJavlXEQDZZP3JI=;
  b=S5PaFiujjS+lhOmFq3mLSkpW9fysUMu5Rz+qGhtSgig3M7hkuZyzg6aT
   uuYKiiBUudYXFauT3Je+0LK7jSzksfa6S+fmmqDBOf+URXVV5IDedFjuy
   1vIVLnCX4iMxkCo60BkI0e+swDgDUafcfR5CxigORwoLSm4123hsRLbRE
   cmzEfQhPZD1QHltSUAZAH/WzQ30C8iuC7TfH5Elf2QqFLfAbj2UTnMGcX
   Ms6xmcPnK2kmrExA1gza634MtzzCgVuOBiUuklI86Lz0/tOOzOr+Wn1hy
   HG24cdeqLgkCx/w6Mb3YcUlSrxWsGOSmLRtiGo31/+EJZqojFMBlT1p4y
   A==;
X-CSE-ConnectionGUID: aWOthuveRPSDZ1tVhDgbBg==
X-CSE-MsgGUID: 1gE0dS+FTCm7ZxSe/8uv/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70433355"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70433355"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:45:37 -0700
X-CSE-ConnectionGUID: L5oquOi4RzSHvuGPIcM5QQ==
X-CSE-MsgGUID: meWZh0FPSAi3ZPDUVfbplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170917036"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:45:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut6io-0000000AScj-2OEy;
	Mon, 01 Sep 2025 18:45:30 +0300
Date: Mon, 1 Sep 2025 18:45:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLW_mqrhnRIsW-pc@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
 <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d3c9d5a-d3a4-4c94-8199-a5870474aa23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_164544_683406_D61911C3 
X-CRM114-Status: GOOD (  19.64  )
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

On Mon, Sep 01, 2025 at 05:24:51PM +0200, Gabor Juhos wrote:
> 2025. 09. 01. 11:23 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:

...

> >>   - remove Imre's tag from the cover letter, and replace his SoB tag to
> >>     Reviewed-by in the individual patches
> > 
> > Note, this can be automated with `b4`.
> > 
> > 	# Start a new branch of the same base
> > 	git checkout -b v3 ...
> > 	# Apply last version from the mailing list
> > 	b4 am $MESSAGE_ID_OF_v2
> > 	# Do actual development of v3
> > 	...
> 
> As far as I know it can be used only to collect tags offered publicly on the
> mailing lists. I can even use 'b4 trailers --update' for that on an existing b4
> tracked branch.
> 
> However, the current case is a bit different. I have replaced Imre's tag
> manually according to our previous discussion [1].

Right, but technically it can be done via `b4`. I thought you have done that
manually. Seems I misinterpreted things.

> [1] https://lore.kernel.org/all/aJyM3N9T4xI4Xo1G@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko



