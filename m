Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3838CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8HflocaQEcJ3vQkB43/3HyBjFJ4JgOOt5cTkBLZlsU=; b=x5bw4aQH+BWIfSZ4YbOdy4ed2r
	/eMzZ8s9hu9AcOzzTGrY8gDN8y9MYQQ13wIxq6Cdst12d2bWOBVTjaRvNZU3sPU/YQfT9bEwBZ5Ji
	sSFITlD5BjjlRMWkpVKOpFVFGjCEt+qXHVWDW66B+NuNtAGM8c9OvYf7jIsH5cMMvDlFBSzu6/5vu
	7wnHLG2bS3Fz/W7Rhuij5rTLYRSVR7SZatVQG8MydgA77IabYjQGIZdSf+WfN3c8WiOv8KUpA0W8N
	RtiHH+0BryCwYNC595ptl8lIvqOymvFJ1IvSNeQ1FIZTE5JTrr+sBh2jSP5atxUZjaRfKKBu7uzNN
	zItRy0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa8C-00000000aGU-452r;
	Wed, 06 May 2026 11:09:32 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa8A-00000000aE7-3x4U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:09:32 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id D182D1FAD3;
	Wed,  6 May 2026 13:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778065764;
	bh=o8HflocaQEcJ3vQkB43/3HyBjFJ4JgOOt5cTkBLZlsU=; h=From:To:Subject;
	b=pDXWI7/IAKUB7fkV5ppVl7pS8toPucnrAH/8DSZEo6YNzp0bn57QVxSremd8JcmvT
	 Ni8KPDjDKGeGvqeQcOXkl7waFVraIl+XWuQfjbMfXjYVhLzKmin/hfOmO8UV/xRUEp
	 eNA4oSSP0txOaCys/i8qYKEvCxlRhsfnoH03JeM7W0abwvv7vbcieNyo1WbOf60CKs
	 3nrKjSztNVs2B9kcPaVYYGlhMK0FCnp3Im39G+k+3DYtIIOhtG8WYPJS0gyiZkejCP
	 2166U57+lv2hRtJZOG5/mL8aJwtlIJTfVYcgESGXSrkd0JsmcZCVZ/pF3Mp4RVfwiZ
	 5jNN7i4ytfjZg==
Date: Wed, 6 May 2026 13:09:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v3 0/2] Add AM62P silicon revision detection via NVMEM
Message-ID: <20260506110920.GA53971@francesco-nb>
References: <20260209172330.53623-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209172330.53623-1-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_040932_023670_6D671DF6 
X-CRM114-Status: UNSURE (   8.53  )
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

Hello Judith,

On Mon, Feb 09, 2026 at 11:23:28AM -0600, Judith Mendez wrote:

...

> - NVMEM support is fully optional - the driver continues to work without
>   it and falls back to SR1.0 for AM62P devices

Is this correct? Just wanted to be sure, given the issue we had with TI
6.18 kernel on this very specific topic.

Francesco


