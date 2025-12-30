Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02934E95A6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tQtNN59Nyy394PIqJVMYOiWCwrwyrIAWOneIi6Vlao=; b=qEgx6kHr0Bl8lJyFQU+ZaHfObn
	vypDNul3YQD9hYxKkqwJJIaF7fQpEg3Ko7H6A4E7vna9o6nXoYqCXmj8tJBCGnPBGvKtIaTgWm9Bf
	zOu+N17UMlbvDtVBoq953OZhojOIdBNf8iFZrkw12DBowX+cwLenIDGkW7vXfIHYmLSs+oOB5SRT9
	0xGFqGEfvVrVPtzlNe5dvycvZwsZm2RJ3aCefu44QWkDvlFSSnByhXNXUcWtkhorktDeo2Wn/H8zR
	BDSiOySvYPlK7NGCnzm1GOD5FKrnXxS2rlnMqCE36jGZl55SIMv27a0EjBGitJs480EUfqfZT+NQi
	p2bwSRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXcW-00000004k90-3L2n;
	Tue, 30 Dec 2025 11:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXcV-00000004k8s-1Pbr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0CD6000A;
	Tue, 30 Dec 2025 11:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9382C4CEFB;
	Tue, 30 Dec 2025 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093030;
	bh=cbvXc3P0gkf4daKd1w9/tAFqdLjRVYHyMeg6AMHP2II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jj2yeHVNMmcWbZyQ36+LsSqqhNrtnHbfbuBptIp2dJC9tpdZ2dUqoxzH8uM6U4nOO
	 c8YKQI3+3VLUa1uMz3vu/GaVWH8AE/gXfc6AW9OqQ7mcPmLDpS3P4a79iExn7QA/TC
	 3KUwP+ScfDmyPf3afJ0CCy8iKO5grkAEX8Aq7RBKBUHyiPalEeTxN88D2p2JEKKnNg
	 LRdyueOslm5SLJU2uOCyT7aVMqaAAfpuyChpy+iYoN+f+aW3ek03ZgqAPr82ASPYWK
	 TWsVQzmjCu9iGYtsxlKEPAxes3k5fKUBZDmse9Q8s1I1E6v9WPLEqWTZFpe5Ykk5tz
	 r26EZ2pH+d5/A==
Date: Tue, 30 Dec 2025 16:40:21 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <aVOzHWmlJ-eneS-2@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229232530.GA2753472-robh@kernel.org>
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

On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > Add a device tree binding for the TEE-based remote processor control
> > service implemented as an OP-TEE Trusted Application identified by
> > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > 
> > The TEE service node is a child of the "linaro,optee-tz" firmware node and
> > acts as a container for remoteproc devices that are controlled via TEE.
> 
> Is this generic for any remoteproc device or just ST's remoteproc. Looks 
> like the latter to me.

That's true, the DT description of the remoteproc subnode is very
specific to the vendor which in this case is ST.

> 
> > In addition, the "linaro,optee-tz" binding is updated to specify the
> > '#address-cells' and '#size-cells' values used for child TEE service
> > nodes.
> 
> I'm pretty sure I already rejected per service/app child nodes for 
> OP-TEE when its binding was submitted.

That was the reason to have discoverable TEE bus in first place and I
have been motivating people to dynamically discover firmware properties
rather than hardcoding in the DT.

> If we do need something in DT 
> to define some resources, then can't we have some sort of 
> standard/common communications channel? I don't care to see some sort of 
> free-for-all where we have every vendor doing their own thing. OP-TEE 
> needs to standarize this.

I suppose this requires a wider scope work as you can see the DT resource
dependence from here [1]. By standardize communication channel, do you
mean to say if adding an alternative backend to fwnode for TEE in
parallel to DT, ACPI or swnode is the way to go for discovering fw
properties? Or do you have any other suggestion here?

Along with that the corresponding subsystems has to adopt fwnode APIs
instead of OF APIs.

[1] https://lore.kernel.org/all/0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com/

-Sumit

