Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CADCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j322U7ahLow9eX93uZSKOwae7ubx8GnfQ6O6nHWcjWo=; b=E2/O7p6bcLi50SoM/vq5T5EZKI
	qSfZmre64Db0UdunrZvGgQgmawQxTz5FWAbPl2dRHBSxSgBqGLowmvtxr9p6XmfT9spvL6fs27+XV
	xRU8FYE52xkA5YyqPj23VUr4RtMyuClqXFfE6+4r8V/9mdN5mJnjkjKLzMm+bWrInTQsW71NY0hwT
	K79OEnPV3SRQLJgn/kRxL0QAslLx0R8C/TNNAAl8cUGdHHArYFsddMB6lfZHtU75+Ffw/F7UhCWZI
	zjxmnbrZMtL1oWvwAGi8+AWA/vL4fsN8UdH1f4rP7pfVArpgxjMWb0Tube+gmONhd9IpFMkwCkEbA
	LX3knU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrR-0000000BEfc-0hya;
	Tue, 19 Aug 2025 18:15:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMrX-0000000AgLx-0OYW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A670061431;
	Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D132C113D0;
	Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611932;
	bh=qegJliyCwkUB9tOPFffvUwCm+VjLhHymTL03rrMDI5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ogb6q3ZxsL3Pf7yxU+Ivavw47aEkHyn6W67vp/gW2ryEY2aT1erv92eZDsgI93gyw
	 TUbV0UdJocFNzVMVDhCJBhN6TTR6kgb9CWbXmnkHDJ32h5noBnG1o+lKSfq3nzwolj
	 pUv4xkFm/SjjfdGdfqCByMyTIMn455kOkLKdey9PklYOBtmSQ4+VDF0w0d6hANFkqG
	 w5ER7HiAWHgexqotU6+kAkL4QK7vtp4wZSlWNxwes84YDX6Mo83TJq8hRxVv3w2MKV
	 uHaWtHsVxBH3hgYtPK+5iuyE4m9x7cMtbrpgY/wqv+JUSGd61NJgonfKRg2qGUGtOC
	 Cs2gCsTz96QxA==
Date: Tue, 19 Aug 2025 08:58:51 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	devicetree@vger.kernel.org,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <20250819135851.GA115029-robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
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

On Tue, Aug 19, 2025 at 03:17:46PM +0200, Raphael Gallais-Pou wrote:
> 
> 
> On 8/19/25 13:01, Rob Herring (Arm) wrote:
> > On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> >> The new STMicroelectronics SoC features a display controller similar to
> >> the one used in previous SoCs.  Because there is additional registers,
> >> it is incompatible with existing IPs.
> >>
> >> Add the new name to the list of compatible string.
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> ---
> >>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
> >>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> Hi Rob,
> 
> It seems several patches of this series triggered your bot without
> warnings/errors messages.
> 
> Did I missed something or is it just a glitch in the matrix ? :)

'make dt_binding_check' is broken in linux-next which is used if the 
base commit is not specified or not found. The latter was the case here. 
Should be fixed in tomorrow's linux-next.

Rob

