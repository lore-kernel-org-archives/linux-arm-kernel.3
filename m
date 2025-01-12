Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A958E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 22:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJBy60kKXNMvIyExEUDV0hVHXtHyDCXCBeBi9Tj3OSE=; b=SEgiNAJmiU6Up0RDh6HaNl6zmR
	lqcLirRSp4G7/Gh37TqeV/+Y7/FL7jlRkL6CUB8Ydne10/t5v6QqVpKJemAbnAqtZ9qQMQoNTwJef
	bS6YagF6rlPIMYJak+eLllhaooBANXl23Y8JKIFWqcSi4lALQn7qaMN4nkE8lZtnsjkibThKmgzQy
	UgqyJS0rgiLrR1TTL1bB1FJExT5aOYznZJbBNQtNxhwN5rCgHd+ZiwXt8T7cCN9vrPaUZ8lCp9D8W
	fH4TS82PpW32zReIk4qvmAs8zwcqxacwhDLkH9cPPMBUYZf4sk8fL9r95kmwKsViRPkKylVcEm2bb
	HosNPhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6nM-00000003ZRD-2o7i;
	Sun, 12 Jan 2025 22:51:00 +0000
Received: from mail-10626.protonmail.ch ([79.135.106.26])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6m4-00000003ZLf-3lsY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 22:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bens.haus;
	s=protonmail; t=1736722172; x=1736981372;
	bh=RJBy60kKXNMvIyExEUDV0hVHXtHyDCXCBeBi9Tj3OSE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OBYcZSwP/+kn+ybDJEUNa9gnU/gJRFg9UmnhvjCcpjRepfbyWukkYaBlC1abGF6vd
	 fCvgFcYa61DjSLVuypkZR4eZBquUK+GL3yV4CTdbJGI6O6l2DKVci2BtPUIy47UwM/
	 Mem8GDHtnSbvgPHI4635nRD/DZmMNbAwKAazetOCgw/B0YNlTMwmSbiUz2U2FFEewY
	 cFOYgxoMespHX0DOj+FtNdBS/yTbPTQhfEST1Sdqq9sk0xuRSbG5GK6VAFcF6mRHeQ
	 qSbsRqdZFDouFymHXDvh3HAeodxdCy8p3D98o1KseDW45/Rf50bho6wh20X/GzP+AL
	 ak5aENqFHSWHQ==
Date: Sun, 12 Jan 2025 22:49:27 +0000
To: =?utf-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
From: Ben Schneider <ben@bens.haus>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bschnei@gmail.com, "Rafael J . Wysocki" <rafael@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Message-ID: <aosJmFtjxsJTEZbWlONPNmqzPQRxyZEHnhOknuhn76DchCVqWJNeTebo2QMuVl0AQ5vVxKXNwPH5IWxeAnhiWDhlWz4J3vxQ91QLjHn8Oj0=@bens.haus>
In-Reply-To: <fjdblv62k3nhqgy7decdldtieo4zyv6phxofx72dreyq7jbm4f@qmkp3e2wyplb>
References: <20241125211452.14987-1-ben@bens.haus> <20241212070712.txkxgmiugzji3doz@vireshk-i7> <fjdblv62k3nhqgy7decdldtieo4zyv6phxofx72dreyq7jbm4f@qmkp3e2wyplb>
Feedback-ID: 124562356:user:proton
X-Pm-Message-ID: de9e1846e9c51310cb99671b423aaab57c6d6552
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_144941_703671_FC06D335 
X-CRM114-Status: UNSURE (   5.18  )
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

On Sunday, December 15th, 2024 at 1:23 PM, Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
>=20
> Viresh, let me try to test it this week on Turris Mox.

Hi Marek, were you able to test this change on the Turris Mox? If I can hel=
p, please let me know.

Ben

