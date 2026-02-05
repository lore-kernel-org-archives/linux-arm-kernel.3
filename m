Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB51E9129A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xhgCdb8ep0MUSZSzP4umfl0hprQa7j65RkYqJwXC50=; b=BCVIFZ5Q+9uN9PyGVS1cLS1imY
	0VfMNxtmKTSJRLEGWve8LF08VRlIBTNn4RChbJX99iYAIOJvCuOC9gsbJvPx/v9MfsQlcZtxRCjCb
	DV9ieewL6Ai/tP8k3nugXXAy3MqUPZwrO8AxtX2bfGCwGUJK65T/aaEL0J93ImUlSgo1nailAM4+3
	bBfrGKQZDfs6rEqKTerOKmFLM99RFlukdTmoR98tLedLOKf/Njk6d5O3ejk/KhvZva7swE1CaRz29
	cwgJ1NElEZ/Jz/9z2JUxm2j0Pq2gmYqswo7Jy9wfY+qogFLvhZAT8Vrsb/9ywoMrm8EqJ7eDMO/7d
	DxKMaHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Jj-0000000A1Sq-1Ni7;
	Thu, 05 Feb 2026 14:26:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Jg-0000000A1ST-0qs8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 14:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DA2F418B9;
	Thu,  5 Feb 2026 14:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E753C4CEF7;
	Thu,  5 Feb 2026 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770301603;
	bh=hmGTxmhf2yhUyjpwEbkT9YrgxVbfiFkHG7RA52lTQ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2J4d+8d/kLtjWX81Pu/kl8qs396W/eqbqQin8NNtRJZler91/EuBlbEd+5wTySuh
	 dq4IUMj6X409mZLHA6t1mBcmet2KJmBYTYF3GDLNqN8PfpbFejeNisMakCS3YvBsii
	 4HXhM1q6DtTk/LXrG4qM27aU4bfunQIuBdoMOI0tXJ1lz+S6uMYJrRNWhzFj6/880f
	 gOHNHx64o3Tmt/rO81i4sBkGyDFAniIB5qlGQ2JIpF0mwbmvhbBBOQWB4c0fvRFN0/
	 PB9OEJfN1TIFxHTPzd7Y8zeRQHJwQEcyPQWWNNlocbobqqWxwoe21OGBeqRm33aftU
	 9sXZqYJautIiQ==
Date: Thu, 5 Feb 2026 14:26:37 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Debbie Horsfall <debbie.horsfall@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Zena CSS compatibility
Message-ID: <20260205-marigold-nautilus-of-defense-9da91f@sudeepholla>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-1-34adb95cdf89@arm.com>
 <762a8e34-e401-4b6c-ba73-35cfffcba4b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <762a8e34-e401-4b6c-ba73-35cfffcba4b2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_062644_260188_89E23F0C 
X-CRM114-Status: GOOD (  16.48  )
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

On Thu, Feb 05, 2026 at 01:29:18PM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 18:37, Debbie Horsfall wrote:
> > Add compatibility to Arm Zena CSS Fixed Virtual Platform [1].
> > 
> > [1] https://www.arm.com/products/automotive/compute-subsystems/zena
> > 
> > Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
> > ---
> >  .../devicetree/bindings/arm/arm,zena-css.yaml      | 31 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  5 ++++
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,zena-css.yaml b/Documentation/devicetree/bindings/arm/arm,zena-css.yaml
> > new file mode 100644
> > index 000000000000..42699b4db41e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/arm,zena-css.yaml
> 
> This should really go to one YAML file for most of FVP from ARM.
> 

Fair point, we have existing FVPs in [1]. We can move this there as well
but if it becomes too much or if we can get it more organised based on
some category in the future, we can take it up then. For now, I am happy
to shove it in [1].

-- 
Regards,
Sudeep

[1] Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml

