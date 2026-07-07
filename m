Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td3DkUog3MMXb19T1n7bIJOaJA4tVZopsj9LWuTWV14=; b=dCmyWAig1GNkvUERVp/e9zilcM
	GO+VzwRq3OyzGl7cK0f+YmdIGdJQE5MGlEV9Pah5UKSjJAvYpmBW0S/RP330GQud1aiQKlzcNEVO/
	7Dd40jO9CA9obCDZkyaN6GRDQ9aZNx/3UKTZ9DrXoV3MHCLBPCDROX3iozjnAct0wPJDqLuKwivvH
	bMhPtDb/6Ta/9DC8xIlWIMtAdDODW4NKiE3n3v5doNq1opSXVYpAjbyo00VMasVxpzi423/24uDch
	3lsp0mEaZoFwVvyojb6Cz6nN07V4+TJMQliHXjrCXeBSTp2iJ6KCC64ixrExGtHUeewimxgayqHW+
	pf/nnXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0gd-0000000EOAn-42ZK;
	Tue, 07 Jul 2026 07:57:47 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0ga-0000000EO9l-1Tlp;
	Tue, 07 Jul 2026 07:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783411064; x=1814947064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fhVsQgZpEtOHcCVdgw2Mnnouie2yBxLY+aHerA5Kjes=;
  b=O5GV4/fvzLMBznVobh5pP55Ow98gdlvu9UGnUqdmCJpt8wB8bFN/8r3G
   N3kuPwuRtnFapNYLkqyQmTi+EKvoGsLgL+GxeWzI+vf++CRg16oa2uQE/
   g/6DYy1yV4ZPKoFVcXy410sFrlcha5VXKQD5WV8kPlVZ5wVjq3sEBvXyP
   R5UhY5E7CUWvjcrh0U4paIbbukWeVCBfjzMzyjDWk83iYLyIiisAwYyD0
   E7pqv+aDun/mhxYIjSNFAGBoH3eFYzjcGS80U8B9CT9z8/KJyb9LGq80a
   A36VnyztyGG9fzO9qO1ieEdqyawroeA/BNkimewAic0Rg+NGujghrgp5c
   A==;
X-CSE-ConnectionGUID: MG4EQj8TR6yA9vTLJ5Wj8g==
X-CSE-MsgGUID: 69cgNNUtQfSubTJw+baJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83028713"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83028713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:31 -0700
X-CSE-ConnectionGUID: Q3rftImfTt6V5zB4LeF28Q==
X-CSE-MsgGUID: ovKA5NWqQHqtoOhU1y+fSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="292095574"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:57:26 -0700
Date: Tue, 7 Jul 2026 10:57:19 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
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
Message-ID: <akyxXxtj8nyCs-yf@ashevche-desk.local>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
 <a00c475a6ce0469682305c4b4269b181@realtek.com>
 <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md-iOQ5qb5uPZcKJkpS8fmYscw8TRXqe7rRrJS7acE32w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005745_245486_B9CCB169 
X-CRM114-Status: GOOD (  17.35  )
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

On Tue, Jul 07, 2026 at 12:24:16AM -0700, Bartosz Golaszewski wrote:
> On Tue, 7 Jul 2026 08:55:26 +0200, "Yu-Chun Lin [林祐君]"
> <eleanor.lin@realtek.com> said:
> >> On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:

[...]

> >> Applied, thanks!
> >>
> >> [1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
> >>
> >> https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
> >> [2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
> >>
> >> https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
> >> [3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
> >>
> >> https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e
> >
> > Thank you for applying the patches!
> >
> > I'm currently working on v6 of the patch series that incorporates Andy's
> > gpio-regmap patches, and it should build on top of gpio/for-next. However,
> > I have a conflict with the driver patch that was already applied.
> >
> > Could you please revert that commit from gpio/for-next?
> 
> Can you just post the series as a follow-up? I try to avoid rebases unless
> absolutely necessary.

Would be just leading reverts in the series appropriate? Otherwise it will give
a lot of additional work for peanuts.

-- 
With Best Regards,
Andy Shevchenko



