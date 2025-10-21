Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C3BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ehypxs6NqIrfQOZ7K1xfSYPtdTxoYI5fqmOmDSbLgo=; b=cqnHEwnlWvU+knC+0QQx2BNLuN
	/guxTgAuVZOPdQp6jDK6Y9R14hClEqJd5ZQDFZPGG+3028gDP+ALq0Je/T90RDZCeI+y1QxiTIT4d
	3FI6+GVLP8EIUyyK7fGq3w2ju25AXBPZYdHlOW9+UOc7yNDU7EqECq12CjIHbIH1plvOruQQ3qMmF
	vGrXgNjnmpvOlv0EeSzNTLj1BsQdQnR5sND6w6cemSRZNGrgu0ovqC7Xle0fdmB9UFKjytqd20BJG
	gsuOXZkiwcli/NhqtUDr6pKDyfpp3kalC2cYuYpQqNoeJM0WsBx10iVXX8tfOVonhPr/gKYISBiPX
	IRU29t0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCvJ-0000000HF6i-2IAT;
	Tue, 21 Oct 2025 14:01:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCvH-0000000HF60-0kMi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 14:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A6044415D;
	Tue, 21 Oct 2025 14:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EA9C4CEF1;
	Tue, 21 Oct 2025 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761055270;
	bh=2ehypxs6NqIrfQOZ7K1xfSYPtdTxoYI5fqmOmDSbLgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XK574YGTNZ1ED6z+iqXzh/soXQPQY9IJy1rszRDAxB4RykMozZdqB04ZGQSr1aDGx
	 Xam2bP9jq1weICQx2XXGsceGbI+u8S5kptMQvsy3kQAGV926bWxD4OUmgk4XYUyuPS
	 dELjAvRFryKhscR4HxFo8mi9PiRLoFiBElOcRKwPjbq01amVPSExVDB5N7D+JDH/0X
	 byMRJQz2wuReFrtJ9XHxzaFX9r6wTb/GbIh9DTkwYJCfsS9BmAiXT3YDTd4FD/HbhX
	 SeK2TZuwOwfJsFqk/BjPWBRYp/lCQMKPYGS7TmPm6fqz8OVhkTJhgQmNyCpdi4cM39
	 J6lnBGLxU0tRA==
Date: Tue, 21 Oct 2025 15:01:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: vgic-v3: Trap all if no in-kernel irqchip
Message-ID: <ca8e9756-6fef-423a-bbaf-3b4dd2105beb@sirena.org.uk>
References: <20251021094358.1963807-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrhBdm47gVnop6o3"
Content-Disposition: inline
In-Reply-To: <20251021094358.1963807-1-sascha.bischoff@arm.com>
X-Cookie: Accordion, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_070111_236044_166E3634 
X-CRM114-Status: GOOD (  10.50  )
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


--IrhBdm47gVnop6o3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 21, 2025 at 09:44:09AM +0000, Sascha Bischoff wrote:
> If there is no in-kernel irqchip for a GICv3 host set all of the trap
> bits to block all accesses. This fixes the no-vgic-v3 selftest again.

Tested-by: Mark Brown <broonie@kernel.org>

--IrhBdm47gVnop6o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3kh4ACgkQJNaLcl1U
h9DUqAf/QEERGOisXRAq9CnwcS80G6M2khAIySPsnBn8KAxqewg/FUc6Nov1YqoA
UtpaWCV7P+z4WVv91UrkiElDSnZ3uvesUAMwPA4pdLXyJmWakNE19j59kHkngDPj
62NO90HobyTNCHvjoghR0XLFJekpv6J6G3ZfJNtxcrTXgAfpKvbbWKh1JBuevJhx
PizWl2nm9xc8PY/5jzjOTu//nOOgvCswkKP4L7Ted1y1JS6mcX/uOs34p6RfSyEq
ndayWTYUAcs9O1C08j8UMz6LYwUsj/9eqLXqrTnDnNbqgYRi/zkTH2MDVEN7xdOY
oNmByRdx66CWu3g5L1Iv8aduzyXHHQ==
=ToAD
-----END PGP SIGNATURE-----

--IrhBdm47gVnop6o3--

