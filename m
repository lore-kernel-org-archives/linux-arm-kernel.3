Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3362ACA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re4QQcAs/Cvsl5dDnqb8X6ZnBVY+DhJFENczAUr8r6A=; b=Wm72aw198y95xYMt862WnrZ3YJ
	pNbkFbHDhrAHaM53ZRvfvI3t5Ao0XC+Otzx2mSYiX4JubffAwNl8I4oRlGSfK7H8n1sFIEzklCnNx
	+NYaWQ/hcBnCYRXz4HvQYYE6Z+BFPRUfZOF8LGsPZwCdgtqeG1y7TXMQIZJu9WJPAn1I8oSOMsN7v
	y8OQe/POzwz+KzIia8uhd1htetHiqt6upp5HZePlz//Q085Yj7Wko09WYG9W8jV0NnLGSitRQsOpz
	okKa1GcMG0nsSx6OiqfOdspGIqQp3+4HJy8vR1o9VXTKk90k1ySLt1LevH49sZ0Mgk2sMRY6hn/Pl
	B4SPlgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfoA-00000004eHQ-2yb5;
	Tue, 29 Sep 2026 21:56:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfo8-00000004eH2-0nPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:56:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97584406E0;
	Tue, 29 Sep 2026 21:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD271F00898;
	Tue, 29 Sep 2026 21:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718975;
	bh=Re4QQcAs/Cvsl5dDnqb8X6ZnBVY+DhJFENczAUr8r6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=im/ErjYUssfdgz/Kf72KQ0N245vq4BW+IBFkzEpUWQAoG3lSon1uiI+p32sa8Fdou
	 h7Oy535Oa89aPfdBABT/h2WoTSkyA79XbU0X6Gk+azJLeF86D89+6XxkefMS0IcTRm
	 XF+blcrtiMQN7CP1L6+k8Oj95J2XLir6SRSF7Y7VmmrVhyfzzo10T5IssJLLE5Z/FC
	 taSyRJTDVeKVgKkHirWNKhq9OjbXeC3pVJ2y7o74vZQe+IjOwpPcM1A1ctXl5w4wYU
	 zA0v7yfeFtbBpPMDEEJrvkZo4gor8xSlUnC4TXrxMAM9k9u+puj9j21FMEwBPOVEJ5
	 RSoQirlxQI/fA==
Date: Tue, 29 Sep 2026 22:56:10 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvjKjrh1NU4CKPE@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zPKB6sLRXO6DyADj"
Content-Disposition: inline
In-Reply-To: <arvjKjrh1NU4CKPE@gremlin>
X-Cookie: 1 bulls, 3 cows.
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


--zPKB6sLRXO6DyADj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 05:22:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:

> > No functional change.

> I don't think this is accurate, as you're changing the register into which a
> value is loaded (x0 instead of x1).

> That seems to be correct to me, but worth calling out that you're fixing that up
> in the commit message and dropping this line.

That's actually an unintentional bugfix, the original code just uses
whatever random value was in x0 as an exit code.  Probably that was
non-zero so it all works out but still.

--zPKB6sLRXO6DyADj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8M/oACgkQJNaLcl1U
h9DbeAf8C8nZFlnRID2OBd8OZhIoqwONWnOjUfc7e88n8BL3U3f9gqi0aLKUu21a
49TZ0kD3k7FLWElNkch4olF4stGSIOSX3oXbf/1CDqg4idW0/zJZNriF7p6olzD2
VtgfsTxGHdHmvno6HUx3mQAQ0iDghOrx4VWj/VeOmnysW+XH2xisYGx+hBTdS9To
WMZFDoE9kTTmDHHArh6KqxPcVGHEzTqJ5lgRv0Fj5p8KP/Px5QEosC+24dNnQcpR
zAiI4W2PjFFKXgUbs8QPVwWNJSz7kHNDPdCh1zfXmgShEecIX2GUrDyYR7cWzmf6
c4XrVFVy895JLbLtZviifPCyQOzP6A==
=90AP
-----END PGP SIGNATURE-----

--zPKB6sLRXO6DyADj--

