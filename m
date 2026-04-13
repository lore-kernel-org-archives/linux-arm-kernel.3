Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF0DF531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oF7+4SGRAImH9WMGSId2dJm+4RdrBt2YGrt25aFUZUA=; b=s3kXqA1UKWhNjY262LsodLEzK3
	zXUgYqL19tkoPPUIw4JM/wDlG5Fjh8Oc7mchQCVLpkLU0oTL62m/h2dBh8G8ndMUQ+M8S9+1N0Irg
	7rFtIZLXah+cHm9mudrQ/qhvSdIeJdLL6pkXYqFtNRQ0lJJluykRSZAZKFWdXSV0Addl8K+mCK6Pc
	W+MDUvp0lnFaUSxcNXkrjlr+LmUusiMN53r09YdQl8u4dJ/hb56oFYORmvlOpS5Q7slXOZf9b7XVc
	EHqTq2VELSmTrYSNJmbQfe+6YkvL79K/Nh0hghKF1jMlBZuOmCMpMUQ9LRTgHsapju/UbB7QUiruW
	HkCNPfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN0Z-0000000GJ6K-2RnT;
	Mon, 13 Apr 2026 19:31:43 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN0W-0000000GJ5p-2Cr0;
	Mon, 13 Apr 2026 19:31:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9BAA81380415;
	Mon, 13 Apr 2026 15:31:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 15:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776108698;
	 x=1776115898; bh=oF7+4SGRAImH9WMGSId2dJm+4RdrBt2YGrt25aFUZUA=; b=
	eBEb3+z4uCJ5XpVJfmMDtd+Hz4pTmn4rIKoszU8vf+435LUmCEc3EJdi4K0/oVv8
	C+yjXVYuraejFdA/rcQOSN6Zfi5pNlS43GslApllsudgHnK44npvkIwaUHWVTtuh
	Dw/4I/j/UNeqyr1LQlKmH5vdXZciz/2GPqFtFHFDNoaInKEsvm7hwh9DYdVnGoah
	lMAIbVhEjH95sryDmrUzci3AfaiCDHHYDZH3oXJ/R4+VlvsfKJPopXWx0JE7CxaE
	ognvTjwa06PAMT31z/DBGKMGBcoGUsjb6Y3k+6cm618rMbyQ7yCpT6T6pE5XH3Hf
	w2SGXNdq7Abx7TrcOF+CrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776108698; x=
	1776115898; bh=oF7+4SGRAImH9WMGSId2dJm+4RdrBt2YGrt25aFUZUA=; b=f
	K2XbJ97Y0jsbU1s6LswXOEcaT2AuIJQsZKTCiqB2bsDjsavXFxXjXN24HUjqmHPV
	30lUfZzPVJ0GZrRSLZsyTrPlhAwj+oOp7rzHIcW4Q+ggBxcGWjNT+roTWJQkS80p
	muhmPfZao8pyrAslQS6xE9YgbnnrpBmxpEViK0VuBn5kyHZfCSLFSApLiy8hZEkj
	X3o7U4xt3roWjYEf/0QsKGiNqeP3myXk/e3+BEa4KYIE59wmYsrhudiDwV46CB5d
	E8K4OFv0fHuOdK14nnUUxfff3rCPKj8vJw3X7p6M4i0BpN1E8RSwySIEaUf5sCqK
	alHtK1Rc5jgsKIF8k3s0A==
X-ME-Sender: <xms:l0TdaRMQ1ovC5UjXw9wB_riUJbJZBZQ47VcEC4ozPMlWVwTWyL-hPg>
    <xme:l0Tdaey9qAPkMkkSsq5ZowyLiVSaVZg3Aabqq1QUbhdAX-Y8VC29U600TE9HTIGWj
    W-h6ka_l-N0bKYGG_W-3bzXlHGY0ZcjcSbZR_zuoL-6Ds0X7Q55CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefledtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthdrshgrihhlvghrsegrlhhumhhnihdrvghthhiirdgthhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    lhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprhihrggsihhnihhnrdgrrdgrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhl
    vghrsehgmhigrdguvgdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprg
    hnrgdrohhrghdrrghu
X-ME-Proxy: <xmx:l0TdaTelOssYXt15-FK9p6saYLM_nmrvIO6c-_F3ZyF6_xfZywmCYA>
    <xmx:l0TdaUxOkh6ozfKMIVT4v_qdW_i5Tss0CLMqkf2F01TBmahdCnZo_w>
    <xmx:l0TdaUWn-LdWx2_7oUHRu6zzNshE3wCLw-aFKzbUUXN26D6Q-_6vLw>
    <xmx:l0TdacTwYVtUWJnf_Fdh14nt-sYvlNq7AaQbOTvOw2Uu221fQyzEjQ>
    <xmx:mkTdaTH5uGiAlbaAI17-uSN6CKxYeQsdeWCm3ruscf_j0l2LK_Chakad>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 04818700069; Mon, 13 Apr 2026 15:31:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMdy4yCH1GcR
Date: Mon, 13 Apr 2026 21:30:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Woodhouse" <dwmw2@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, "Baolu Lu" <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev, "Michael Grzeschik" <m.grzeschik@pengutronix.de>,
 Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org,
 "Herbert Xu" <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, linux-mm@kvack.org,
 "Bernie Thompson" <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 kasan-dev@googlegroups.com, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Thomas Sailer" <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "Helge Deller" <deller@gmx.de>, linux-parisc@vger.kernel.org,
 "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 "Paul Walmsley" <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Message-Id: <07df88e5-208d-4aac-9668-a3b0c65ae529@app.fastmail.com>
In-Reply-To: <7a48b636cb3146f4f7134c6d4fe42070ac2edb43.camel@infradead.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.592237447@kernel.org>
 <7a48b636cb3146f4f7134c6d4fe42070ac2edb43.camel@infradead.org>
Subject: Re: [patch 15/38] ptp: ptp_vmclock: Replace get_cycles() usage
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_123140_934086_B52A23AA 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, Apr 13, 2026, at 17:33, David Woodhouse wrote:
> On Fri, 2026-04-10 at 14:19 +0200, Thomas Gleixner wrote:
>
> ... depend on TSC_RELIABLE=C2=B9, since if the guest doesn't believe t=
hat it
> is, then the guest shouldn't be trying to use it as the basis for
> precise timing.
>
> =C2=B9 (Or... one of the other zoo of TSC flags for the gradually redu=
cing
> brokenness over the years...)

It looks like this is sufficiently handled in the caller:

static int vmclock_get_crosststamp(struct vmclock_state *st,
                                   struct ptp_system_timestamp *sts,
                                   struct system_counterval_t *system_co=
unter,
                                   struct timespec64 *tspec)
{
....
#ifdef CONFIG_X86
        /*
         * We'd expect the hypervisor to know this and to report the clo=
ck
         * status as VMCLOCK_STATUS_UNRELIABLE. But be paranoid.
         */
        if (check_tsc_unstable())
                return -EINVAL;
#endif

With 486 and ELAN out of the way, Winchip6 seems to be the only
one without X86_FEATURE_TSC, so I think the next logical step would
be to turn off Winchip6 as well and remove all X86_FEATURE_TSC
and CONFIG_X86_TSC checks.

      Arnd

