Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0D6C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U26BwfjGu0ZDjt757734uba9SAS16WYrs7B3QfwHKTk=; b=hw4TM4KlglGN0KiekS+YzJlsht
	eZTtVdaGRNgUUI8qf8I0JLyjmytdFrK/jgvRgeVGAcyvs9XsE4YJTFVyA0LhWsXYKg4hfGE+KzaBw
	vsucR8+3+3aZFZHNay0mKR4ba+xBwUSbYn+DbvW2NWuxRzMYj4WrLG8GcsHbPLFXMa8ZS9ZpAqXUP
	7bJoS32EiR1F/PFCFNr/UC8a6drGiZcZUz5RWKSBtfTJGMS0eDp6QuWP98zN+r5SkB4S9Ugv5bQxp
	e1/9hIcw+GcDguHH6N0sJFOMZASqFbk62rpt5pUt+SLvGhJoHxUbIcyxuISDi/1xXYnSXlKhZ/5Qs
	ATCM3khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZt1-0000000CMEJ-0XMQ;
	Wed, 22 Jul 2026 16:33:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZsz-0000000CME4-3EOb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:33:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20234600AB;
	Wed, 22 Jul 2026 16:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1EB1F00A3A;
	Wed, 22 Jul 2026 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738012;
	bh=U26BwfjGu0ZDjt757734uba9SAS16WYrs7B3QfwHKTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SUgoIFtIjw9t9w+5MgYFRZc9WdrCBEgfU6t5R+bd2mkxS1b24Vis5wQ3T2Czl8pmD
	 x+7tIlmI8dQjFb4nA9BuqskcoRGdeirD6HxOGRASksHhDrSJQ23n2Xx/5yntyQ0h9q
	 OP6m4xFgLkbHADZ1pD2sIKg5TLH9013S0x6YTMQ201gEBRFQx43RFFmV/+pI1X6tlj
	 HYwrMl+UbmTiVOVBEpoFXIoKiCFQyV/g+/G4ecUzWGsxn6ezQo7DLqjCayYhRmpAHw
	 tcfpJVatXDSSE5cu7EPot8Jgf1T+63Y+QrsDY9hqg/bze/IfHQqf3PbVeYWDR+sfly
	 zLkFrZu0R+Lxg==
Date: Wed, 22 Jul 2026 16:33:31 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260722163331.GA2865613@google.com>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
 <8e9101ce-e9ec-4111-a1a6-7a9a07788818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e9101ce-e9ec-4111-a1a6-7a9a07788818@gmail.com>
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

On Wed, Jul 22, 2026 at 11:46:16AM -0400, Demi Marie Obenour wrote:
> With your patch, does the driver also pass stress tests, such as
> multiple threads using it in parallel with varying algorithms and
> message sizes?

As I've mentioned before, the self-tests (crypto/testmgr.c) don't issue
more than one request concurrently.  They are really designed for
testing the software implementations, not the hardware drivers.  None of
the hardware driver authors has ever caused enough about quality to make
any significant improvements to the tests.  Inevitably it's just push
the driver in, *maybe* run the existing incomplete tests once (for QCE
it's finally getting done just now), and job done I guess.

- Eric

