Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92117EFCD63
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VDfG04cNVeR6YuGznBcIEv6wNecTfPiYWXn/UKlUxA=; b=MUuHxRQj62lF3BI9dmZC/97T7X
	XxMjYApxt+1loqaitpTHpYM7xZBgkTWuJpyq5KesGNfXSOZjirU0wsf3m/xB/GUdTOdEFhAHkoFBo
	ccTbeeoSpec5Z3gnIXc5MdosAUXmASVFelVyY94QRO2MrYjSbe67qaE9Im9Vza7fj0vGO3kqxzcSw
	75tM4s6Q+o89CylBfOKHraB8/UOBUH923vLIBiclyJuc89UtjEpdUo2Nz1WZCPm7W4wimhMUaPHy9
	yyEhgJhowZWybeG7Q+XfN5MNHyRca3VNHSVEWs3mHoKLt7ev9b28EdjgKiKNu06u1ZjJc2m0c+rOB
	1uGCOhqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4L-00000006yxU-3lJn;
	Mon, 09 Mar 2026 09:38:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4J-00000006ywg-2lKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9D384322C;
	Mon,  9 Mar 2026 09:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22A3C4CEF7;
	Mon,  9 Mar 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773049110;
	bh=r+gzEksCqKxFBjsj75G36A9y534AyJH+xrAw0HmvU4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soFZC1PuyuJeC66KRnXtr9PEHil+9JB9s3I/xeMt+Hyh9YkxhDZEkFPIdH39TcnRZ
	 rhT97NBqx5ef7mHtHeO91wFiTkgvP5XwkYlVyyXbP4hbl7tkJ9i9Tj6dUwpP6Mu1Uh
	 bE1U1QA44E9iTC8Q3EfDjaz9AvNaPnMorf3c4cipOLqLf9FSkdhR9tx12WxIlXB67X
	 FCy7oEcOxDsZMlE/LPu1b68y3AvGvFVnoiWbC8oYjx6uLW2kwN2GQ+OCZmInu7G7ex
	 BUJXDsfhcJqVX+Bu2OezRIYsuA1pqKy9xb/ekIBpkI9549yW4FwcINuyIabtgwUVIM
	 fCgEH6fX2GqFg==
Date: Mon, 9 Mar 2026 09:38:27 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-bold-space-ibis-fbff63@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_023831_716606_CFEF66C4 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > Hi Sudeep,
> > 
> > On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > > On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > > > Fix misspellings of "multi" and "currently".
> > >
> > > Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
> > >
> > > [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
> > >       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
> > 
> > Thank you!
> > 
> > BTW, I noticed some of your commits use the non-standard
> > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > with the lore.kernel.org instead of the recommended patch.msgid.link
> > domain) to record the origin of patches.  Do you have different git
> > setups on different machines?
> > 
> 
> Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> I use only one setup and if you are observing something like above, I am
> doing something different. I need to check what is that, but the intention
> is to use "Message-Id". Let me have a look.
> 

OK, did a quick check and see last time I used "Link:" was an year ago and
that's when I saw some discussions about use of "Link:" for other purposes and
switched to "Message-Id". Let me know if I am messing up something still,
happy to look into it and fix it up.

-- 
Regards,
Sudeep

