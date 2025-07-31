Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlM0dB8yb47JDk4czdoq1u0oRL4Jkv/Jn+2f+Y6ruiI=; b=Auavw2v7403HJu5BnS1IMI01dR
	8lY+jI8wysjqb5psh3C+L9bfrIMWVaF8i5iB6R7HX6RkXDpsLsLGF69A4lKA3mVhGw3JbbHEMoGyb
	vBZDjqNEm7SH7UDtO3ppvRtrzd7hihNWqmvvRxe4k3R019jrX7wHxuM91TckfuY4Vyo6aE3qefW58
	KvvErOsZpYo3SHBkWRZj9yHmMEXI/Kwyc6Ry5B3Sy/HzTtI/GkEE0PoFb1YxTNh1MunfrF7vNqt5Z
	HPAEpl6DPkF+MGQF/msmFk1aBmCL3r1OSzl0m5KkYo5HtD7cWbONrWLKsFjzvDgQiJAw/O/+Ovtxv
	vqS3eyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhV0m-00000003w9j-34A3;
	Thu, 31 Jul 2025 15:16:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUeQ-00000003tHz-3Qob;
	Thu, 31 Jul 2025 14:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hlM0dB8yb47JDk4czdoq1u0oRL4Jkv/Jn+2f+Y6ruiI=; b=Bzp5E1cU/nr0wPC2eMkkv5w8Sp
	pgz5XPolNMm5xooZ2YagM0JIlWVkbxXJ6bdY1xu3FN22RZH53VozQ4nB0kCxj9tjZvpRdfN05eVE/
	j/crKIMf+C0ifBYL56xkO7phRQpy7FvfeHoXcfLP215J8zi4GDZJhqkEEnaJkLLn/Gww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uhUeH-003NdM-BO; Thu, 31 Jul 2025 16:52:49 +0200
Date: Thu, 31 Jul 2025 16:52:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: npu: Add missing MODULE_FIRMWARE macros
Message-ID: <1ef51e54-9ad1-4e98-aaba-63d493e22959@lunn.ch>
References: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_075258_852697_D42199E7 
X-CRM114-Status: UNSURE (   6.30  )
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

On Thu, Jul 31, 2025 at 12:25:21PM +0200, Lorenzo Bianconi wrote:
> Introduce missing MODULE_FIRMWARE definitions for firmware autoload.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

If this is for net it needs a Fixes: tag.

    Andrew

---
pw-bot: cr

