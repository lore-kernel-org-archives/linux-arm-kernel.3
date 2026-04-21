Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51246F8FA7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oX7js34Ty9gi3X5OAkW3UGKu+Ts72tUof8lXu9rbg4g=; b=vvYYSsuvTN4p7YaN1tr6/ThmLG
	9eeU487LfkOhqkfteiaaeFGIgcPe3RFrJ9OA9qWEAK1LP31pC9SyzjamC3HM1KwLbBqbNUv1UdeMl
	BSK9CWPT7xwVzO0IsqsQTORcnTzdNKL6M7B0KqucGojMN+firgIfoBlmliFu0ksvmi1Sga6PIbKa0
	FZXyaJA6u1iN+tLMMZ98mKt1yI2rypWP44YAhqB9LteZI6Hcp/4FiCzDEjCR/a9ce/MeUVdGQa1Rw
	5HXjVP+MrwuiPngPoWhYwLHsoa0XAj819VBaPLESvdFxapgD1RoEs8MwbjIF1A2R3VhjnXBjWeFbf
	eB3wDQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBUA-00000008gty-2Tup;
	Tue, 21 Apr 2026 13:49:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBU9-00000008gtn-3QeO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E4179600CB;
	Tue, 21 Apr 2026 13:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D90C2BCB0;
	Tue, 21 Apr 2026 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776779392;
	bh=yFGp4q9dd69vORspj/F4Kgjs/Fxf0CHEPtkH/U80wYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sL5hElquKB/bBDpkBst9KuxNe/vUGmfdKnY1xzsF+gF3YR/LajhF61fFEo+0eM1sA
	 /ynJ0kntn/yKhTPxKyli4lZ+dfY82uM8r0ADwsXoPbP4ZljFqR6sHUgxo6CC+MoGIQ
	 ucIK5DU2TqokF5jAF4AD+wbEsM4TD1+gUuFyV/1ICl3Yp7C1xLidR+5iGnbkIPQ1+h
	 Aj82dL8R1tiDtfwNkgd+3CcZLpWvmP9A8YYR5Vmay+S1PR0fYNKHLssFa5EGAlvuZx
	 noVkGWnOEdEnD2mS+RdxPnLEJru8a8OtSncEcddiojDjFYakXhOpyIjkyCqxUwdCfZ
	 erqqxXkxYkBJA==
Date: Tue, 21 Apr 2026 08:49:49 -0500
From: Rob Herring <robh@kernel.org>
To: "Kevin Hilman (TI)" <khilman@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add power-domains-child-ids
 property
Message-ID: <20260421134949.GA1045294-robh@kernel.org>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
 <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-1-c2c40bef238c@baylibre.com>
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

On Mon, Apr 20, 2026 at 04:51:17PM -0700, Kevin Hilman (TI) wrote:
> Add binding documentation for the new power-domains-child-ids property,
> which works in conjunction with the existing power-domains property to
> establish parent-child relationships between a multi-domain power domain
> provider and external parent domains.
> 
> Each element in the uint32 array identifies the child domain
> ID (index) within the provider that should be made a child domain of
> the corresponding phandle entry in power-domains. The two arrays must
> have the same number of elements.
> 
> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>

Missing my Reviewed-by.

