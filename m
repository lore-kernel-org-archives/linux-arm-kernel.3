Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1759C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNi428VMmxCpWKvb50p/bX9DgxfivgEs4/Ad9gqYDsM=; b=zBjWtVLAktJUt0t+2JsD4voyqR
	PkU+kaFOmWcw3ZlRaz5BycC+b2LfOb+08SHhiQAYTyWHLSgCTtPx7Pt4fnne4z5AWk8H5eKive1+x
	kcmEyyHjqQbdglBQauQb6O21pT2d7kEJ57krtF1TFYgb3c/dapyZ97+GCayfV7H1bCY/ReVrYKjka
	sRyyWa3+t/JBEgBR0h9aXDolw25ma2vidwgqtMK1qkt+cw2M2xcIQ5g7Par+QSwi7EUf9J8jX9uXp
	I+0gj8x9jLpfguwgjDbLKvSZq7LO7MLz+zx/QChkndzu2TnsNK/DIYuQD7ns0/xDwwP+JhDtZP9WL
	vOaoW9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fuC-0000000Bn7i-0pPr;
	Wed, 23 Apr 2025 19:37:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eBU-0000000BPMr-0PpW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Apr 2025 17:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nNi428VMmxCpWKvb50p/bX9DgxfivgEs4/Ad9gqYDsM=; b=YWI2EmG4FRvXxLYua/yy0Do2qH
	PQq5VCau4cnViUM/7CC3IxFvbZGOrBa7uhtqR2/q6CvntgBimYGEpftGZ6bE1pi5Ph5f8pnY3NYau
	+7DWQ7Ky4iiE0bwFzPKRWCdpMMEXS5A2u3JIxW2TGUVVWNg+WHNCMfbhA0OOKwRy/FgvHJlXTG/Bl
	vmEwV88vI2UnQ0ssM7/ba4mfSARJBk9NNOJnT/DPpB0RKXnIC5JSBh2KZnTIMo3aWYx81975abKYj
	vxkYbeKwclRP3HL98Di01TaI2LrOkr8Hh/TUjrjOD0TbqTfeMgyWtIGf/7bzHPUH2hnXpnMVl2p0P
	C7mxWiEw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7eBQ-0000000BSTn-409i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nNi428VMmxCpWKvb50p/bX9DgxfivgEs4/Ad9gqYDsM=; b=sqBaQ1uxVV1Pn/zOz3VaBK6aKx
	/I4dFGbXcARGryXfnbvPWLGUtk1kZlUt0TMwuBBUgGzsc3TawnlO4KVddk2aiB7QCiDSrPFPX0UhH
	fAnQPyqWRWhA73bcXJ2cxstme/cqQdzOdeNSmykzWRsh7LguLYXdC5mKFviArEbe7kE7StwD/luU3
	KaDv+C24wS1f2nrM7EGI4Qu+rjOFF0owG01q4uyOVWtiu6Lq6cJ+r2oe6qSLvesrvkieXTZFlEpCY
	oJqVHW/y/NnxmVaJAjV/Hdz8qBaF/6CgmBwCcTXNn4Q2H5Uve2R+1UJLcaWz6BwQT9kp9UqPXceRD
	DY3fZ9pw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54318)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7e93-0006K9-0Z;
	Wed, 23 Apr 2025 18:44:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7e8t-0000Dc-15;
	Wed, 23 Apr 2025 18:44:15 +0100
Date: Wed, 23 Apr 2025 18:44:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yury Norov <yury.norov@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAkm79R8f5Vf6TLh@shell.armlinux.org.uk>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
 <aAJq9mGswYsnAOS8@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAJq9mGswYsnAOS8@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_184653_157795_06A0BED9 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Apr 18, 2025 at 11:08:38AM -0400, Yury Norov wrote:
> The _replace_bits() functions return fixed-width values, and intended
> for: "manipulating bitfields both in host- and fixed-endian", as the
> very first line in the commit message says.
> 
> Those using _replace_bits() for something else abuse the API, and
> should switch to FIELD_MODIFY().

Sorry, but please explain this statement, because it means nothing to
me.

FIELD_MODIFY() replaces bits in host endian. _replace_bits() also
replaces bits, but has a wider range of which encompass FIELD_MODIFY().

I see nothing that precludes using using _replace_bits() with
bitfields.

I see nothing that would differentiate the behaviour, other than maybe
religous ideals about C functions vs macros or upper vs lower case.

Please explain why you think there's a difference between the two
because I really can't see any reason not to use one over the other
apart from asthetics.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

