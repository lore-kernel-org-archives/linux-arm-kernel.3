Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B7CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6CIAXlKpIRMtXGQ/qenvV1rR6NnhU4WaDFG20FSUNo=; b=3nxPZQOWvQ7gFtk/sfBbmR8nec
	EVDNdndjCtWzwQgoCWv1LSZarKtm9hBX1edjX+ELiz4tDlGJbfuL0malZJxEzAIlkOaKdRO+UNsk2
	x7zFP+1XyYXIoH7BAEhTskmvQUX7JiF8AET5VkrO+TTrN3P4jNfx0b/6UEusk/mkvTmMtPa+ecT6r
	jlkoVjLH0kxDrHNLTEHbAe+ayoFGgvYnmg5KBRF/Y3z9f+Ee0EddI7zF5BHpdPxQ0EoaXNgznbVsV
	AF1yJeAKbVERUptLHo8rWB7L68ZugWmTRZ/cCLqKrpMctqBBuzTteII+BlaQEK7rP6J8ohohBsZtv
	YeTgnwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7U-0000000FdUa-2dGe;
	Thu, 21 Aug 2025 03:37:44 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosbg-0000000FF9q-0O9g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 23:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755733469;
	bh=y6CIAXlKpIRMtXGQ/qenvV1rR6NnhU4WaDFG20FSUNo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P1RUhGojZt8l0C29AJXMI+5ULjY9PSItG6GVXXp2P+Q9Wo1A8feroRxpBLuz7fUR+
	 ogF5DkJJbDbf3dHnaOI6/KPjpHKh7EZ97AWD/aMd+o+LEOcUVF7WfjZ0coewZl6co/
	 d5ftGO4jwiGzNONFHM9b5C77R/S4csVrshmsuohE=
Received: by gentwo.org (Postfix, from userid 1003)
	id DD6264028B; Wed, 20 Aug 2025 16:44:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id DC703400CA;
	Wed, 20 Aug 2025 16:44:29 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:44:29 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Sudeep Holla <sudeep.holla@arm.com>
cc: Jeremy Linton <jeremy.linton@arm.com>, 
    Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, patches@amperecomputing.com, 
    Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org, 
    bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de, 
    nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
In-Reply-To: <20250818-mysterious-aromatic-wasp-cdbaae@sudeepholla>
Message-ID: <1e3ae52a-0aea-3146-429b-6a0035181b26@gentwo.org>
References: <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com> <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org> <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com> <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla> <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org> <aJ20imoeRL_tifky@bogus> <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org> <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla> <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
 <20250818-mysterious-aromatic-wasp-cdbaae@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_165240_171219_9E64FD45 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, 18 Aug 2025, Sudeep Holla wrote:

> > But returning to the original point, its not clear to me that the HW
> > 'cluster' information is really causing the performance boost vs, just
> > having a medium size scheduling domain (aka just picking an arbitrary size
> > 4-16 cores) under MC, or simply 'slicing' a L3 in the PPTT such that the MC
> > domains are smaller, yields the same effect. I've seen a number of cases
> > where 'lying' about the topology yields a better result in a benchmark. This
> > is largely what is happening with these Firmware toggles that move/remove
> > the NUMA domains too. Being able to manually reconfigure some of these
> > scheduling levels at runtime might be useful...
> >
>
> I share your concern and hence completely again representation of any fake
> data in the ACPI topology just to get improved performance. Yes we have seen
> that in the past.

Depends on what you call fake. There are microarchitectural issues
regarding the proximity of the processors that the customer may not know
about and therefore the data provides by the vendor may be considered
"fake". Certainly that is not the case for our processors.

This is a common feature and widely available on other platforms.
There is no need to do anything but enable the functionality. Having a
special version of ACPI for arm64 or a special handling for arm64 does not
make sense.

The ACPI subsystem provides the ability to add blacklists. If a vendor has
problems with their firmward providing data that reduces the performance
and is unable to fix it othereise then the vendor can use that feature to
disable these ACPI features for their platform by submitting a patch.

Please make arm64 work like the other Linux platforms and do not introduce
special handling for ARM64.

