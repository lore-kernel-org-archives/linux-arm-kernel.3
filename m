Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB40EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=; b=JrUHbGpea6gfEjFzSSXJl01e1U
	O6uU8iVbclyV28DXoRtvC1ssjP2E2ggZkvX1WWmuXHyitqC1DZ61rPjeaa9tusCZWR+Agu4sc5hTF
	RhCrVFvfFvazXs9yRAO4m5GBwdGs8Zud+ygGM3DjKmHF48HhZXgLlOdqpHvn5UbqLbaY1hdik1h0L
	RPSm+yPRnLcW+VIuyTrmkGtJTsPIugl1P0OeFFkecpnjrTUG3DcbMbFrY57BrIf0z7IGRxO3zOKEB
	cfy1a7oz0u0edsi5Lsy1mwRA24nv2tDAc9Patvz9IEBK0WCBlCjIVjzQIxP0q1tQB2QiqfOsXc5Gj
	j1RVybIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubE6I-00000001Y1W-2WJm;
	Mon, 14 Jul 2025 07:59:50 +0000
Received: from mail.tasknomic.com ([141.95.16.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDpX-00000001VIi-3TtQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 07:42:34 +0000
Received: by mail.tasknomic.com (Postfix, from userid 1002)
	id A493CA488C; Mon, 14 Jul 2025 09:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tasknomic.com;
	s=mail; t=1752478946;
	bh=KDRQi4pCoVVuRyGkn9jX/8tJgyEhGA8Bz0yDnVVeEfs=;
	h=Date:From:To:Subject:From;
	b=Wv8ZbfoyMwuRI2NnVW7ZFdil+pyiyLVuEXTj8f+V3CEjripc3mqPwzFDnk+CAOG8z
	 rii1vORV/jJkk7Gga8RMl5X9593pUIwCm9XhAgEFlIdgGybmLIwuFaAbrseOWqsDG6
	 ecKJHdIKG84g5C6W3FLy6zEJWi3oO+tNcsQ0euh55Ms5OYAZWnP8nCucPVbjVyuDMk
	 IlFTdE9Iqu5TsioNx4MRRssXDrYKS6N61Jvrrw4Q8aa7qX0Ayp5aPJjQBZcLXgo14S
	 Yk+BeloUU8Vx0V5XmxWKxfRqUVlpkGF0NUAv3YL5qxSYteUPEnKHF+wG8qLdFEBMin
	 iY+5X8NZBHNrA==
Received: by mail.tasknomic.com for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 07:40:52 GMT
Message-ID: <20250714084500-0.1.k0.14jpa.0.91lkk9adfj@tasknomic.com>
Date: Mon, 14 Jul 2025 07:40:52 GMT
From: "Jon Brennan" <jon.brennan@tasknomic.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Equipment - chairs
X-Mailer: mail.tasknomic.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_004232_556413_DFF2D42F 
X-CRM114-Status: UNSURE (   2.80  )
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

Hi,

Do you offer a seat for corridors or waiting rooms?

The shortest possible length is about 12 cm, with a wide range of practic=
al dimensions, with a little over a centimeter of space - with a small, l=
arge, large roof.

This is a solid and convenient solution that can be selected by furniture=
 distributors, for use in public matters throughout Europe.

I will send you the specification or photos - can our product be used?


Sincerely,
Jon Brennan

