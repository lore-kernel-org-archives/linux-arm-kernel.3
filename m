Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7000CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtwLUm4ss8InPqHFXRIa43dw74xrqf2eZ5aONDws8Ng=; b=ukO8qhCCZCbV4g2NgUX2qu+4ou
	lstfdN5HatWxrJSTLX/4JyXj28dHhlXCl7zkEXE/TXd1qoRzzPWIZnuXi3iWireeou17ut+NlctZO
	u7m13aC644dmg+jHoIK6hxS5Dq2gwigmN7biPonpTvzmcArNB+jKh++GDVJIP3wc2vZRlwxpGShbo
	J0VQsmfDXO2tWkXM0CdjhbT8yxhvPj6SA0jdDhAhNjwq73SsTXO/544IdLosC9SwhjHGY/PK+ykxj
	CM+bAIYIpdKTCzsxk5xSEV1Gr1wHn8SK50XvOydE1AYzrw/Ys0Ku0U87h5AJI8/Zl6mMxmFK5SICq
	OWykuZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdADv-00000007IHe-3kY1;
	Wed, 29 Jan 2025 15:43:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdACb-00000007Hxo-3XWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4183DA41A26;
	Wed, 29 Jan 2025 15:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60928C4CED1;
	Wed, 29 Jan 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165324;
	bh=GplWvWETMezm9d36v4eAfoqt/au1TivnkJ+SWeO2lSg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aU7xY1/zYzJuaW6w9rNm1ubl5Xt+CWFtHsWN2RKDfRYDVbS6hoIF9qvqRPP/jdC+o
	 n9sc28S2gI6BwQGNNkViJtfEuGMgf8yXViqR0bVptbi1JGdt4uZpDL3rC+zLYdD2R2
	 LvRr+oYrBTHfe0N1TI7nLfb3oLUOcNMk6jlIoAg5MOCpNzo+MotUd8JaUv3wKoon4l
	 tuVdgnNv0djOjt6DKfIc7gmEm0g5OKUWFx4Yfktshh9bhs5uK1rRKp5QLYBX+v7URg
	 lc1VdYMtw06mrr+76GOR28iAJW7U2ehBlI2qXh9oSISs4oV4/EZifWpzvEERxf1Lkt
	 yXZsdTh95S+vg==
Date: Wed, 29 Jan 2025 16:41:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
Message-ID: <20250129164157.3c7c072d@foz.lan>
In-Reply-To: <87h65i7e87.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<87h65i7e87.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074205_956280_211B984E 
X-CRM114-Status: GOOD (  14.57  )
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

Em Tue, 28 Jan 2025 15:42:00 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> [It's probably time to raise our minimum version again, especially now
> that current Sphinx has better performance.]

Last change was about one year ago, so it sounds fair to also
change Sphinx minimal version with about one year gap. What we have
currently is:

	2.4.4: minimal version
	3.4.3: suggested minimal version.

Looking at the relevant release dates, we have:

	Release 2.4.0 (released Feb 09, 2020)
	Release 2.4.4 (released Mar 05, 2020)
	Release 3.4.0 (released Dec 20, 2020)
	Release 3.4.3 (released Jan 08, 2021)

So, the ~one year gap is what it takes to raise the bar from 2.4.4 to
3.4.3.

In terms of Python, we're currently at 3.5:

	Python	Release date 
	3.5	2015-09-13
	3.6	2016-12-23
	3.7 	2018-06-27
	3.8 	2019-10-14
	3.9 	2020-10-05
	3.10	2021-10-04

	(according with https://en.wikipedia.org/w/index.php?title=History_of_Python) 

Python 3.6 is the first one with f-string support, with is something
that most Python programmers use those days. So, IMO, that would
be the absolute minimal version we should pick.

Yet, IMHO, we should aim to be backard-compatible with the tools 
available up to a certain date (Jan, 2021) - e. g. we'll aim to
support at least a 4 years old toolset for documentation build.

So, I'm proposing to change the minimal requirements to:
	- Sphinx 3.4.3;
	- Python 3.9

By setting Sphinx minimal version to 3.4.3, we can get rid of all
Sphinx backward-compatible code.

I have already patches with such changes for it on the top of this RFC. 
Will send it shortly as RFC, aiming to send the final version after -rc1.

Thanks,
Mauro

