Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5077DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDacvcNqO/YCc02ZL1XxmQenH7l0nSeJ0+Vl6+kiLTA=; b=0D4IIGL2kbGWKFrmf/2DvcQOJI
	kftlI74Yq1oILpYFXEoRU9lF3+furfS0U7CvleqAsinskAGuhkxEtYR4SIOLLWhDF6TEkpZ8xKtQI
	d4Tq7DP7JokwvA6zrXc/511cWD9qQ0nJDcTVrVBtV4Fr2HJ+VprlaYS5vZ7lNpAur3qSBvdDCmz0r
	GD1el7DyBb7Da/FLAGt0Md3Ot4tvcDB4cvbqgkalQh+f+6wQ9Ds+/ZQTOGmIJO9njNzhq/gkkyv/+
	AdPDIdqRTaJ43uHtENpNw2i2NDmDRdo4d2hUK7KIQ/t+FO+n/SlxB0r+4VSGjPGwY8Ao00qyvack+
	Z++vwrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7epn-0000000BZki-39CO;
	Wed, 23 Apr 2025 18:28:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eEp-0000000BPne-1dgq;
	Wed, 23 Apr 2025 17:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47E6EA4BEDD;
	Wed, 23 Apr 2025 17:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EBCC4CEE2;
	Wed, 23 Apr 2025 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745430622;
	bh=Egp3Yszj4dH8xTnJVf5ZAxkxoyrRymUIA54q4ihDQHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7Hx2Et6Gc58QrcEBYMSxR4ISbAAzxE36+ukyUOr7y3CPDLBhIK0sTsC0/zxaYHEl
	 DfLzLcxqfCD4RAV2ToZbpZcVkpYp5JN8u7F5tlZYVb63jscDdepELpvhqdihfd8MOX
	 L6sPy/Lfjtzs106AqLsHozQ+8Bir45pOHn2mPLpVGoAVPd4h5vAbe9gNKUyJ1W0SQ1
	 wSmoHkgyHZls087dZMOY0oikCvUsKNvVmlbq/Hr8OqAYMhneUHgKkAm5Vy4KWy9ttS
	 mslgMN1ZZn4Te57TvTL9m8CZXJVTXhHcKA2pcq07gliK+vZpYDMm8lNZX9ZzZjhxdw
	 2C1CrEmYmAXrA==
Date: Wed, 23 Apr 2025 19:50:16 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 2/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <aAkoWCtCS7Lxx3Gx@ryzen>
References: <20250423153214.16405-1-18255117159@163.com>
 <20250423153214.16405-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423153214.16405-3-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_105023_491925_401505C6 
X-CRM114-Status: UNSURE (   7.56  )
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

On Wed, Apr 23, 2025 at 11:32:13PM +0800, Hans Zhang wrote:
> Register definitions were scattered with ambiguous names (e.g.,
> PCIE_RDLH_LINK_UP_CHGED in PCIE_CLIENT_INTR_STATUS_MISC) and lacked
> hierarchical grouping. Magic values for bit operations reduced code
> clarity.
> 
> Group registers and their associated bitfields logically. This improves
> maintainability and aligns the code with hardware documentation.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

