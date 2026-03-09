Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE3EFCD6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztg2GYEDMy1SzNeQY7iwWazQRYyE3YX3b8DYOt5aKbI=; b=DNnO6rP7CfoVIowmMxYVM1e+iW
	60droOlYw4UuJLpHScuv9W0i9VXXu+IwYE3JdjAHZVhHvZWSYFjNz9LFJhyL/X/oaquGrsWRap6l9
	jR88ai/GJvc8255RqqHoyTo1U7BAQIJPMKrouCxVBXFAyi1iTuvmHCeB5cFjQobRIhvpGai2CKZ/G
	efG0rZDLCK8Rhkzlzwq9jlIX1mUAt9+yvKDKFmX1JRyHQ6uLBc+iHN9oEF0Y8341Ncz9Mf+kSBkwN
	qvn2ELoCDfkB73OgNZ2IunTIrO7wdXq9GDfiEF42ElJz5YAIJkS6ZWUI2OjuxTr6T2eT0PPt5WN5g
	+tPzwnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWvh-00000006yNu-34Xj;
	Mon, 09 Mar 2026 09:29:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWvd-00000006yNY-1oZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:29:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2D9640068;
	Mon,  9 Mar 2026 09:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A360DC4CEF7;
	Mon,  9 Mar 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048572;
	bh=qeDwrBfSnOuo+v/tHdiGCVYuv0G2V8Y+lWM6M9KmcNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUxztMj3IbCiJfpa6sNiZx979NVYXHdf08+Tkt6WwDQ/JPcnxrPeCleaK/NQKa+i4
	 1OXlNTSRE3Fy856TVZCHpA4ujw9l1M4OZ1BBL+IjAo0+ofBIFbqtxGrtkPZH1TFoTv
	 txBQx2gr8l8wTdyn5Ev6Z/LmZHLB0LalmpuKD4UA8Ih8MZUobQimcEJpyS8UcJArX4
	 tk6ioRYzX/+aabqDB8dYbJeqr2L/zpvSPdUs0Emrh/k3evkwFQpqVr4UVkdWe2/DBs
	 9hP/N+ng66c6+GLlxUDUw+WaX7SYlWQZfAYiLpA6EKht/+IRevIkOkmJeq/tX35sAV
	 JbPbTLba+WCpg==
Date: Mon, 9 Mar 2026 09:29:29 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/,
 s/currenly/currently/
Message-ID: <20260309-bold-space-ibis-fbff63@sudeepholla>
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_022933_490828_5D0AFEC5 
X-CRM114-Status: GOOD (  15.88  )
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

On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Sun, 8 Mar 2026 at 14:01, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, 20 Feb 2026 10:55:15 +0100, Geert Uytterhoeven wrote:
> > > Fix misspellings of "multi" and "currently".
> >
> > Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!
> >
> > [1/1] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
> >       https://git.kernel.org/sudeep.holla/c/4e701b47c3ba
> 
> Thank you!
> 
> BTW, I noticed some of your commits use the non-standard
> "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> with the lore.kernel.org instead of the recommended patch.msgid.link
> domain) to record the origin of patches.  Do you have different git
> setups on different machines?
> 

Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
I use only one setup and if you are observing something like above, I am
doing something different. I need to check what is that, but the intention
is to use "Message-Id". Let me have a look.


-- 
Regards,
Sudeep

