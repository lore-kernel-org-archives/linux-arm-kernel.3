Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02212CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Cvlcl3lSVxIswV9jynJ/e4AYCtz89efpAEudugYMIw=; b=rscFljioNtUiWcXRJt9Bx67kU5
	/gzfT2JOwBzzBLMew255aVNDUhhsfAOG5Xwi+IvBqYLYhwksxHHvaeprvADdhNhPMQTHVTYJBWQxx
	CEd3bLq3Q7BaH14n0Fq3sc56dzMPGSV0M+iFyn0i0MUCbgzNkMJl5eCU0rGoVMzOPu/MY5i9f7oKz
	B/DOl7syKuIq1TDr/T8SA0o/MgmCA6cupwgymbXtrK/bdE3xEBx+Fy6u3orXVgHF1Gl07z/VxWTEQ
	qbwkFg3dSde91F6QTqrrzuG8N3Cgt1CZHqYZ+AYTe6t6BYo99ON6QB1khLqwRqqh5kwdPCEUY8wvK
	VR+ugqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFfJ-0000000Chuf-3gC2;
	Wed, 10 Sep 2025 07:54:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFfH-0000000Chte-3SF5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 606EC44470;
	Wed, 10 Sep 2025 07:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFF3C4CEF5;
	Wed, 10 Sep 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757490891;
	bh=/Cvlcl3lSVxIswV9jynJ/e4AYCtz89efpAEudugYMIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByAqknhQxTz5AuwNFMa3NeXS+psWNlXu858IH8RhV5WRDRT6/Er16498NMAI/6bBD
	 SsC6di1+qrYZKG0/JLFvcqTvMr778/sGlSuvjhc3v7KNFW/kHbl2CwMpRFR4Bu051l
	 ErX7CASZW0ejiZAsqXt0gFlI0gWrH7YNL4Xmy/DMDRBbPry/DVhl/4pP5qqFKV8f2x
	 h8yd10TqVJiygJy32AMSB5ilvaj42MMp/VVLc9xh6do1MDxS1tIxU07JPOTLpA805e
	 e8Cp5j4A/PLS0IIY/yEHZyxPqkY8mah+LGTBZfNzP7ncfQCPQbt5Z5LJlbCiidHE0R
	 kPE8/SWr9/cPQ==
Date: Wed, 10 Sep 2025 09:54:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v6 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
Message-ID: <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_005451_881901_C7148F75 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue, Sep 09, 2025 at 12:12:12PM +0200, Cl=C3=A9ment Le Goffic wrote:
> From: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
>=20
> LPDDR and DDR bindings are SDRAM types and are likely to share the same
> properties (at least for density, io-width and reg).
> To avoid bindings duplication, factorise the properties.
>=20
> The compatible description has been updated because the MR (Mode
> registers) used to get manufacturer ID and revision ID are not present
> in case of DDR.
> Those information should be in a SPD (Serial Presence Detect) EEPROM in
> case of DIMM module or are known in case of soldered memory chips as
> they are in the datasheet of the memory chips.
>=20
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Is this email defunct now, that you add second SoB?

> Signed-off-by: Cl=C3=A9ment Le Goffic <legoffic.clement@gmail.com>

I still see in this patchset around 5 different subsystems. Nothing in
the cover letter explains the dependencies, so grouping looks like
coincidence and you just make it difficult for maintainers for no
reason.

Please organize your patchsets per subsystems, see submitting patches
doc for more details.

Best regards,
Krzysztof


