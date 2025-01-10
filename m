Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92CFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOo09bpxQlzJYHcN6ESWZS7W/HkR369MLm8d5iEBXuQ=; b=BRLNwGgD/oI69y3cH2NGAXLl9U
	EmDzXwEKj69CMzAUPN2EH7qNHsyyoVdAblACKqpkh2KRnJ2LVzZxToKB3AOvhDmY99XHRLsq2ysOu
	5IyOJuYj4ezRAHP88Bm5ClFtctLr3EKAgVxorBWRiaIUTlNJRYO6VqbXJAm7uQpaxVzVn31LgO/h2
	MUehMTuO6IlurjNZnuJQWpCBZdqi1mEkWmE+n68uyd9DpE0Hynjx9BoxNbtqYrYapUBmughF+bzEw
	/LlIKWutQx808Hk8aCniHrU3QBM4aSGmInK6XVknHJtviJa3J5rH/msaxBmm6Y8dy8Yli88QFytRi
	61wRslhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHiq-0000000GCoF-1yo4;
	Fri, 10 Jan 2025 16:18:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHSs-0000000G8Tj-1evZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1FDB5C06BB;
	Fri, 10 Jan 2025 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E656C4CED6;
	Fri, 10 Jan 2025 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524945;
	bh=TZdtNZgzKfFSZDkfTfY1nF0VsjVWi6pk4YB+xNa4n7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VExMSHCzE5s37sT9ikrAm/5ta2nYN0/bR7j1w2UBIcH8o7Jja7RqQy7lMFT8ZGHuo
	 kx+s6Ld7bZ4e5gznnSyGJ4XX4Go7R6NVe8ZNiuNevwFY1XoO7e582AGc14A2iFpin4
	 IF83rQjbjdqikYrZnVKnN+hmi8rOXXmpnnbniABXDxNmmLXpmUlAjhg+iQO+R26g4a
	 m4Iwg/jmNGkYfXyNpbHiHpjsgJUtCKIFArat4bxXA/ZIwTAObS3fu0MzSIJ9R8WEDC
	 2kHHWmzD8g491E7AGPERPLF6J2KV0RLHbt7Jk7lWK1AjnUGiPNqNs5qwRFSBqusdnR
	 uKUHjoB4pmkGw==
Date: Fri, 10 Jan 2025 10:02:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/8] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <173652494400.2948275.17068411464064341962.robh@kernel.org>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_080226_474776_37275521 
X-CRM114-Status: GOOD (  11.78  )
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


On Wed, 08 Jan 2025 14:16:04 +0100, Alain Volmat wrote:
> Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
> Remove the bus-type property from the example since this CSI has a D-PHY,
> which is the only bus-type option, making this property redundant.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: clarify commit message related to bus-type property removal within
>     the example
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


