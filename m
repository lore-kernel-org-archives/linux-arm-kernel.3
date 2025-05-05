Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62C9C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nwkb4533cnkgEOovGIY8bmWIMqTqCYeGxbR5tYw46QM=; b=npVjS9mEfhOEPIuDUJ4W9dzx3L
	ZjSeQl5eX6B4QsnCzLU8rwQCZqvgWFpMY2rosCDTJ1M4EXFW3zoO2awhOVOQ9zmwjrdvmh17d2FEJ
	Mxx8dRf7Pv0ITfsmNuL59ewEKCsRPorOD5QxYIpD9tgK6jlv06SmLqrgBlXOwM6/Ui5SCuZSdeyIk
	HEE7rlrMnswfrAxokJD51eFsNxwSySYb9yasFteglF7JrjLZENkUvKVRPKiob2iNFXG6vDSerJCTq
	IVrs/p062l5LTAYdLlJZq6Rz/MyQHcq/IcejyydC1L6Vor/myiNHqYyrCa3vKs6fQyLszB77h2/bf
	HcczqxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2cW-00000008WgW-30Yn;
	Mon, 05 May 2025 20:41:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2aU-00000008WPe-1nxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 20:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD109A4C771;
	Mon,  5 May 2025 20:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90450C4CEE4;
	Mon,  5 May 2025 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746477533;
	bh=Nwkb4533cnkgEOovGIY8bmWIMqTqCYeGxbR5tYw46QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ncz+TbktmSTf07F89Z3vST5L7x2VI2HxQppVQkwLJzo1Tld2luiXvdmYLiVhp//7f
	 rHxPilqU3LgSPxmaihCPbJTwjLX9+U5MT0+kO8a6kFg3NPdb/9CsNlSKE41+g4eQ1F
	 xRM//DI4BFJbgc5mNMEAOwOQgHdopU21C6wR/oidwHe2uVl9uArPKLojdt2yWypt0l
	 Neo0CXkyscsTr+HTeF1Ek+ceEs+wHrPndwf/4ogYSKQMr/HUbwi/vH34hCBhErsno+
	 W+YBwvax50EmWl4iV+9iLMcf3I0mplgMw3KWh4u2UI9vF30g2uyDqOdFzQil+88kBB
	 x/zDDalYyAwvA==
Date: Mon, 5 May 2025 22:38:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <7oxuyl2d6zcv4ucqrny5bytodiqmxdxgcxovdere3cier53mlb@tuuw4ooldnvv>
References: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
 <202505011756.SZDFqCew-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505011756.SZDFqCew-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_133854_536573_47382898 
X-CRM114-Status: UNSURE (   6.89  )
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

Hi Alexey,

> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-wmt.txt

please send a v3 with the MAINTAINERS file updated.

Thanks,
Andi

