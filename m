Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BEFE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjC3gK2lb2BwoAZMxgmOimL4OSH1bZgNkJlq6el6Rlg=; b=sWT7VPqmSCFRssews37GeywgsH
	/orbMHj2RN/Rwz6AwoZM4JELe4JTAcPWN3ycLAESKj3i5D/paibhtGSlgUCU5DW0muXIopkTgiLKs
	QOKOr/Y9S4Mah+DgKiHwfgFNStkXTrqh/foqrV2r8hEg4he3HNN7ifa1NChgfrAq0w2MBO0pkaeyY
	DmDMd2qn6m4pVHnHs5IbudxOenLrPojoKnpYlZjn7KCa3yiFSwaMUWMIG7ZD/EzqKgmUTNTV951js
	1A56KYuFS4bdXjZ0m1FOGItlYV050whKZKgdxqNOVnYPp2vzi/+X1XNnv4Wfk+hdWVFLLiiZYvt6+
	PCR5jFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoIT-0000000BE6d-1V69;
	Thu, 09 Jan 2025 08:53:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoHD-0000000BE08-3Cpa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 08:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25F025C479D;
	Thu,  9 Jan 2025 08:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B661C4CED2;
	Thu,  9 Jan 2025 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736412746;
	bh=TvUNJv8yJjtpo185rkOPuPVGK4fNp0KoEpN/gIjMEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUrBrvNPOcUnmh+bwM7eTNr+s19B16W+pxZ10Lyneb+7oPdPxS6ztV23f3nQqQ+aF
	 ORW6h+wLS7iWEfKUMxi+02GRWkLX6w1/10lgHHZ9Gz/UT9AUgHHHtAh7NaSDetddNB
	 4mBNORp70DYyYkTYL7GuclYVUETWav++tg1tAIWXY0iUlWd8BxZ8KJEBwKUpx9w7sl
	 xASZ6QQA1nKFzy58CEISqgFZ9NsdvHCOxOCrV+JOQ4xpnqm8R3HK/EDZLNcCkdct9V
	 RmEf7KUeeYBDKl95jJ9BN3IRnpZFEuj1TOQhGfKZZ2TDvA1FLpHC8B5eUE4MZg4meB
	 YjsE6413js1ZA==
Date: Thu, 9 Jan 2025 09:52:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <q73tpquvwrbrlhugbik3pfkzsywskbntpdtkmhbqrz6qdx2p4d@7flo7ahmfnme>
References: <20250109002622.771-1-mjchen0829@gmail.com>
 <20250109002622.771-2-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109002622.771-2-mjchen0829@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005229_364858_3AF34B35 
X-CRM114-Status: UNSURE (   7.20  )
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

On Thu, Jan 09, 2025 at 12:26:21AM +0000, Ming-Jen wrote:
> From: Ming-jen Chen <mjchen0829@gmail.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


