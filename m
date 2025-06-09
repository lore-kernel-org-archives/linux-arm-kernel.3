Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD27C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwvXDVinElV0bRbdQOk0BsWXXzDHpMzF/l0aQuRwLgw=; b=w1KJEY0UpjRVIZ/JtYHy4L9iUO
	NCUsiJhi6/5iswAr9iWmYitgprwa3sdelfqkSTG5e/CYODfHc9k9qCJKFikdCgov51f0rbSMYDQ5i
	EbTsMZUwY4G0AY/6IwcpaqSdWDwyCEKSDlMP02g0ekZ0t22P0+vgCGszz9v995OnrNSNQZRakw9P+
	xoWGY7OLfiPzNpSQhufwNTygnIS4iREOjNtNdGEaCBBWKL9QNOTs9hz8bL8VZRg2s/FC1Wxd1OdoZ
	rIQ+Z0qTcqyZ7AqzO/j3qju8bU+o/FjQKW6YtEROyv9LxM6X7OVCH9Da6TeST/+KhLm5GBj9Y7LrA
	El3LoDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOg5X-00000004mQj-3Kja;
	Mon, 09 Jun 2025 17:15:11 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOemQ-00000004a03-2WcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1749484280;
	bh=b2Wgtom4VQPmWb8cZ96Sldnc/IbgbcGy9qLVL/LndP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/FFabkU8OWROYnczjEpCIlLs4zvR4hKgjFas/26QrtqXGDDMX1ty0XcQUaTtWyvI
	 IcwhfyrwFNzIWey27gft97jEjjwgmTjELbOYbfwg+KPx5pz+uadyrCP06b8Vazt6r/
	 yAZHd07b7SYaOZeG3tewAkSiPn+1OcgorSlxLjcI=
Date: Mon, 9 Jun 2025 17:51:19 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: Provide vfork()
Message-ID: <d4fb291c-e329-4fb6-839f-01cb17afc933@t-8ch.de>
References: <20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org>
 <20250609-arm64-gcs-vfork-exit-v1-1-baad0f085747@kernel.org>
 <df6f5620-5986-4080-bb00-c7bee856bf66@t-8ch.de>
 <4a4ef323-25e9-4bb5-bde4-9ad740693246@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a4ef323-25e9-4bb5-bde4-9ad740693246@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_085122_781757_DD5D514C 
X-CRM114-Status: UNSURE (   9.84  )
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

On 2025-06-09 16:43:55+0100, Mark Brown wrote:
> On Mon, Jun 09, 2025 at 05:34:33PM +0200, Thomas Weißschuh wrote:
> > On 2025-06-09 16:08:56+0100, Mark Brown wrote:

<snip>

> > > +static __attribute__((unused))
> > > +pid_t sys_vfork(void)
> > > +{
> > > +#ifdef __NR_vfork
> 
> > For consistency:
> > #if defined(__NR_vfork)
> 
> Are you sure?  I'm seeing an awful lot of #ifdef __NR_foo instances in
> sys.h - it looks like the idiom is to use that unless it either needs an
> additional condition (with || or &&) or is an elif.

In sys.h, indeed. These have mostly grown historically, newer ones use
#if defined() together with #elif defined().

