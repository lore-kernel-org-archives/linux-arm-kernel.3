Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65385C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4f0KXm8cDE90V81Eg4FbPAEwyy5dVXUBt77qplRE4X0=; b=ijxbSnpQmFPCVsqVKUsPODTvsd
	Z8iJaVl7GooG0uVhN2u4RANo4+I7ZowIl1Khbwvya6nPGJAO/PjJv8jWUKCbdWCNHIschOstIZ2Ap
	Nxb0jxJ12c3gVcYhu3wG1llfqSw2cWey4+5c33f/8EHn65M/a6Ag9jzD8JO8rXbme/hiobVbkjZE5
	yebiSq93Y8wBP8n4wxjjcNOqsulC1WxxFcJAwklSdfVxKsUpHP5aKwWLwrYkDDGImyY3BO567h9ac
	IN+47YU9ZNPbaoV0O/jw//GYuKN+RxbsK9kDbXq5sgHtbRdIv3bCh7kSOc9GUvKDw+0/FQZ0JEC+Q
	xbAphByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mts-0000000F5FY-1wyw;
	Wed, 02 Sep 2026 15:29:20 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mtq-0000000F5E8-26k2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788362956; bh=4f0KXm8cDE90V81Eg4FbPAE
	wyy5dVXUBt77qplRE4X0=; b=k33TDilEMwvy9sMZLPUnfxoKMf+I+JxvR0vxJqtlly2wGGU5rb
	baGVAldCWpAt6FG3NNYWoaZ+EF5n3U2T/C+WekP1Aj1UCtF+mopARxfQP3jPcz3Fw6M6AZw+mrN
	BoV27Ojb8c+jlMIJmGLfjvd6fWpNfdrOtCo7ZaM2uO5fKBRqYwM0wG6eDKIATm0lSwyhCfJiQCK
	rDNf0NJ9zMmVTCFfrI4ByOREHYqjuqFMb2cQbAVp8BOpQCQrAX5xbOdyAeungASLmt4tIEGtJ5/
	ShAFsQEiWPjSe+kjWHt1LmKWTDbrMyYE77jE/qyUeiSYRJvPifFS3UASUAWRHRfcT9Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788362956; bh=4f0KXm8cDE90V81Eg4FbPAE
	wyy5dVXUBt77qplRE4X0=; b=gzhBYxSHRKhn7V5pVk2xMaN6sVxB+FKjO7Z/y2tXbHj3XSFC8a
	6wd4m1rtEm7xrc7VU8RDGABWEyBhhcBoFKDg==;
Date: Wed, 02 Sep 2026 16:29:14 +0100
From: Bradley Morgan <brads@mainlining.org>
To: xry111@xry111.site
CC: ben.horgan@arm.com, catalin.marinas@arm.com, fuad.tabba@linux.dev,
 james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maz@kernel.org, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_arm64=3A_MPAM2=5FEL2_and_MPAMHCR=5FEL2?=
 =?US-ASCII?Q?_are_left_UNKNOWN_under_arm64=2Enompam?=
In-Reply-To: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site>
Message-ID: <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_082918_690336_930FD218 
X-CRM114-Status: UNSURE (   9.37  )
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

On 2 September 2026 16:26:55 BST, Xi Ruoyao <xry111@xry111.site> wrote:
>On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
>> > not, could the caveat go the other way round: arm64.nompam is for
>> > systems where firmware ignores MPAM, and should only be set on a
>> > machine that does not boot without it?
>> 
>> Yes, seems fine.
>
>Sorry for the late reply.  This is indeed the original purpose for
>arm64.nompam, a dirty hack when we have no other ways to make the system
>boot.  If you think it causes an inconsistent state I'd not complain
>against adding a loud warning or something.

Sorry to impede in the discussion, would you like me to submit a patch for
that?

>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

