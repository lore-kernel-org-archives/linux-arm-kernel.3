Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA2EC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vognF5l55JOOji8V/GS67CO1Sv/uRHSuKV9k/gZKTtc=; b=VwYb83bRncEOlvl1fUAFouLqe8
	41hcxP6NsvBhQJABRNQG1+jLIQMDXxBYp47OXEBmheZomkmRncGH3jhK/sngDQhBSjhanuJSxzV2B
	+YzL9IESozUkkXtAQGeoAPB74giyNVgSr9CswuE2oyk5de9XOCioKkFVpDIGKBFgP5i0RYvnFivwo
	nSmm1JSF6GjEfba76bY+Xn6o6GtasAPb5jCKq6c9uDi6eP7h79g2Uvzoc7Ltg8+dQawQJNtAAqkmK
	MZfawzMi3iw29fZFZMWmlwc8G3rSy4WlqSArMT1sOHjCDxEfeZGTI8UGYa/CWQk8kehPdjetEPyqq
	dDKrecdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFT3-00000001xpO-0VUZ;
	Tue, 04 Aug 2026 13:46:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFT1-00000001xp4-3MUI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0823560A75;
	Tue,  4 Aug 2026 13:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4D51F000E9;
	Tue,  4 Aug 2026 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851162;
	bh=vognF5l55JOOji8V/GS67CO1Sv/uRHSuKV9k/gZKTtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jhl3rAljpkP8+TqRtsauYIu4Su1qGtLhkg4GbDxAkGVZbDfJ9lvkdhj5ZSg5JtIcq
	 OxrCq1VTSscdAo+Fw2PSBArOdCuCjwnCQgaAcoXl4cbsvWigByrU6qakupshsBTrux
	 UJXUcrMXCReiXh3VSIJeUzNM9NEsfplSzFGyIwJm7u/7W/c1lISQZcs345uNo47O12
	 4Oe0LtHl8VTJxXHE7xCm7jvWFSYb2wU6m/glgWUhIz0uFVLrizi31ns22iZdWTXeWf
	 DGFyu6P0fNciFrHq+rw4VBqNI9xf33y9HLQS4UCriOrV69SMIm3hV5VaSDz9impxP/
	 v2CjkVJgD7QIA==
Date: Tue, 4 Aug 2026 14:45:57 +0100
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com, james.morse@arm.com,
	fenghuay@nvidia.com, linux-arm-kernel@lists.infradead.org,
	andre.przywara@arm.com, gshan@redhat.com,
	tan.shaopeng@jp.fujitsu.com, sdonthineni@nvidia.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: MPAM changes for v7.3
Message-ID: <anHtFaXrC3rudt-H@willie-the-truck>
References: <20260731175243.904730-1-ben.horgan@arm.com>
 <178566322421.4135357.4986108386959858973.b4-ty@kernel.org>
 <ea6ec065-9459-40d6-aefa-9f08e5281ce3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea6ec065-9459-40d6-aefa-9f08e5281ce3@arm.com>
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

Hi Ben,

On Mon, Aug 03, 2026 at 11:29:50AM +0100, Ben Horgan wrote:
> On 8/2/26 13:12, Will Deacon wrote:
> > It looks like you've been keeping an eye on the Sashiko reviews, but
> > please can you double-check the open-comments on this posting?
> > 
> >   https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com
> 
> Sashiko reports some real existing issues that I have already got patches on the list. Other than
> this there is potential for one-off leaks of the abmc counters an an existing possible deadlock in
> resctrl. At least one of the leaks is worth addressing, I'll look into that. I need to check further
> for the existing resctrl deadlock, there have been similar problems in this area. See below for
> notes on each of the Sashiko comments.

Thanks. I wasn't expecting you to go through each Sashiko comment in turn
in your reply, I just wanted to check that you'd seen them and checked
there was nothing major!

If you have additional fixes that you want to land for v7.3, there's still
time for that so please feel free to send another batch of fixes on top
of for-next/mpam. I'll switch to "regression fixes only" next week.

Will

