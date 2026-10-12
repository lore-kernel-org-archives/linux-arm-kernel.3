Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCA7CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIdQC/igpl1nz8ot81cLXJwNaA5/Di/1/53YpNpdmRM=; b=otjyVoN0Fw7LqBbqZa5Yxfvma8
	DASRnFozIxdtYWGDWkQ2wIWpV0wR5fe2JnSs6uWkZvXB/rJzO38itLEvqZ4k/OaMdLd99Ll2RmUNH
	Vof64e0GYbY8QjQnzyUx4829JpKPpxS2WjYdf+pjoFTiJ2vymy9jg4tRVh2qtZ0ysD/8fEH5mAytF
	Imw5p54o2h5GVjtKlWl83WFVVW5aggmU2si8sprCkGpmuPbSu+/b0x4jpG2FMKi+lP0SYqP0LMhGA
	SnNyr8LGnkOuNfSmwHMypx6PLg8vIS3SHa+ijFrXtOu08bafjjyQMmWKkdP/EFkBwbIfFQ5jEISuA
	N37bNuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCZ3-0000000A5rk-2Cou;
	Mon, 12 Oct 2026 09:43:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCZ2-0000000A5rW-1IUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:43:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65232600E2;
	Mon, 12 Oct 2026 09:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DC81F0089B;
	Mon, 12 Oct 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798203;
	bh=xIdQC/igpl1nz8ot81cLXJwNaA5/Di/1/53YpNpdmRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QJj8tMACfnSPnxPNlScBAT/wjfch/GQtzPrsPM0sPuZFeV5mXe2KoUY+HiU7P6mBw
	 kDt7To4qpJ+u82DGRK9iUh768v+rj9M3DW5g7g3ytynQeiIHJ5tXwjOjJMlmcLXsiZ
	 rdStoU6pIRO2jdgW9mq6k86xdeuv3hfUpISZ9PKqcOCJVTCo7TBv6/mH3gLEbzQvlO
	 pL2JVK1gEo++ge158shQqQhwF47FeygVYKDH2EffL7lwRQa3A4uAizYgdp9tvZMDHH
	 1JQH0poe8r/Frq1zViIRLFdzuoPLjhehDi+wiPXPhYuQ+qGy9/+tRU7qOij1dwV2iJ
	 mb1k6fFKw0czw==
Date: Mon, 12 Oct 2026 11:43:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, stefandoesinger@gmail.com, 
	robh@kernel.org
Subject: Re: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE
 device-read serialization
Message-ID: <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-2-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010130024.177503-2-ghahramani.navid@gmail.com>
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

On Sat, Oct 10, 2026 at 01:59:39PM +0100, Navid Ghahremani wrote:
> Describe the observed interconnect deadlock workaround separately from
> the ARM implementation. This property and API remain an RFC requiring
> ARM and DT review.
> 
> Assisted-by: LLM
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Please organize your work per respective subsystems and then CC actual
maintainers.

If this was intentional due to RFC, then it's fine. I am dropping
everything from DT patchwork as it is marked as RFC.

Best regards,
Krzysztof


