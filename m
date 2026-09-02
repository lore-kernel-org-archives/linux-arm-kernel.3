Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88023C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWRL/71/13sRML0I9ovZkoTukFA4K4ZgczCX4kTAUHM=; b=YjX/mXyVz35iDUe2U7muoeB5MY
	ix5p/oRU0sFkl5uVdRtdwZtEcmH75Q3xWMYIuLc6tsvZG9lDQ/UpN1OlBRvc++OscJrDVNvt35yNw
	6FcZ8CcHQJetqByO/f+uSGTirM0GFXvbTQT03m+F8tPaa8BI6laxotxVIOry2RbcdZa7priQ29/tK
	hI/qpb9LjSaCpf6XgvDWBDvVtc4Hj/eCczYJ88tMXH2RC7+l+AicrAas2bqAfEfR+c9CjtwnLbiQC
	CnUxhPj+FGLCFDLxa9KAEK3Mt8ahbG+rSU6Qq2ad0fap3E+RpGidhpfF9b5ILP1KvsshmMHf+rnum
	/re1Tmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1myL-0000000F66L-2pnh;
	Wed, 02 Sep 2026 15:33:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1myI-0000000F65S-1q1l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 15:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788363226; bh=xWRL/71/13sRML0I9ovZkoT
	ukFA4K4ZgczCX4kTAUHM=; b=rbKPC77vUfF7kgqDP0bQ14Yyc50qS9IY5FDi29X2YtCxerVmb6
	OhszGvV0m1cDuCQiQEy7lbLxI3P30Rz3eJVlcr7oKMyM3LHLZfpfhu5kS7w3NqX8Q5n+zAyomZ2
	evENZxMjHV8FfHIZyuxdP7ZJng70CSqDzQYPcyjpeddoWBqmCy9lf/tZCps8rcg7wGLEDpGfGZf
	HOc9CD+tvsN++LZIPapo0gyuiBBWY7FSQww1XvfwH4L+iVdYc5olR5pMGSgu6Vx0xRwsnYNHFbv
	6k+Me0xHxc/L7okxSzNGuuHmJwOU9cpz7EnUw0tE03gEhekJ57LHTz0n1oj6KbdUvfQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788363226; bh=xWRL/71/13sRML0I9ovZkoT
	ukFA4K4ZgczCX4kTAUHM=; b=UDczQYdejHqmtWnBE38qWpkfPEAkkly+/2hD+zOq3V96lQIWjO
	IkFb8gcLMvw4tVmhB8trHom/X4gqyJhOEQDA==;
Date: Wed, 02 Sep 2026 16:33:43 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: xry111@xry111.site, ben.horgan@arm.com, catalin.marinas@arm.com,
 james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maz@kernel.org, will@kernel.org
Subject: =?US-ASCII?Q?Re=3A_arm64=3A_MPAM2=5FEL2_and_MPAMHCR=5FEL2?=
 =?US-ASCII?Q?_are_left_UNKNOWN_under_arm64=2Enompam?=
In-Reply-To: <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
References: <2368f72ea9a447057456eb37450e1c25f4bdddff.camel@xry111.site> <452D9DEB-606C-4B54-B8B6-27E03573A9DE@mainlining.org> <CA+EHjTxrJB_3ks_rqGAFyihyFwKJEEJYk2ZTMLLXgoMWM+GO_w@mail.gmail.com>
Message-ID: <22876BF5-AAA3-4ABE-9BD0-E4D3D97B123D@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_083354_643240_16294313 
X-CRM114-Status: GOOD (  11.54  )
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

On 2 September 2026 16:31:02 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>On Wed, 2 Sept 2026 at 16:29, Bradley Morgan <brads@mainlining.org> wrote:
>>
>> On 2 September 2026 16:26:55 BST, Xi Ruoyao <xry111@xry111.site> wrote:
>> >On Thu, 2026-08-27 at 09:41 +0100, Ben Horgan wrote:
>> >> > not, could the caveat go the other way round: arm64.nompam is for
>> >> > systems where firmware ignores MPAM, and should only be set on a
>> >> > machine that does not boot without it?
>> >>
>> >> Yes, seems fine.
>> >
>> >Sorry for the late reply.  This is indeed the original purpose for
>> >arm64.nompam, a dirty hack when we have no other ways to make the
>system
>> >boot.  If you think it causes an inconsistent state I'd not complain
>> >against adding a loud warning or something.
>>
>> Sorry to impede in the discussion, would you like me to submit a patch
>for
>> that?
>
>No, thanks. It's written already in the form Ben suggested. Will send it
>soon.
>
>/fuad
>
>>
>> >
>> >
>>
>> --- Thanks!
>>
>https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
Ok, could you cc me in it?
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

