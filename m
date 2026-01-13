Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E86D2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfubb3D0fkSpRc+J48p6HTqpyJx0mKk+BvFrJYYZyI4=; b=sCxWK1DqiJrUPB8k5gLlI8t+LE
	UJgdiAtKnBl0VlZeMbTjPFeRm4qi+Hv2lzUtR1GlyezXLEhrYT8rSDCkla/9hunNiqqc079NPt2Nq
	eSz30KVzMx4ETFW39dmTTR1Q3p1M/m3oUfkzKLNc/PnOgc2Iq1q8W66PdcCDwt38Husjcu7c4FQkv
	WTC14svnvevqY0Hm2XVSQzobXW4NJVcQt4hWSzuQ3LENKr5/j6QI0GdRiSpb4MT2w8ONEsVUththD
	Ze2uMUV0HngSOXtPoLwxgR99HaAIbUFwYtwILf5n0fPHlo1VRYBOWZg13PUjtSgAS43F1xTi48Q0o
	NZeMvcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgMi-00000007Nt8-0MxS;
	Tue, 13 Jan 2026 15:31:28 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgMW-00000007Nrd-0ddo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bfub
	b3D0fkSpRc+J48p6HTqpyJx0mKk+BvFrJYYZyI4=; b=b//yKE6qQWqEuFAW9FmO
	4WzBvqUVopy7AyiOvh+pIdFSTjzXChIh4O5PD9bLXRQU1Te+HadUraX6lfcGzowE
	uLHQQdyVGAuqGY4185GemRYsBt0ohf4TW2MYPFqPKfZ0SHgEtLdiwBX6CGsw2BZc
	7tpEzA2pa+3gxs/ByuxIAJ5xTp9tzZpF7VrCHZzeCBPBPjvSJMlUWYnqflnz84IY
	GxV5MX3H+xKYHy2NOqWyR+8oyaM9ppMN8tlQlNFXQJ7MgrwHcl5D8dwKdh1j1thb
	8w6CpKO6TSHA9cjDopdIqBUE2Geqk0Vclj168kPDKfST5fju5QBWvx+lX0lNs3UX
	pw==
Received: (qmail 1752685 invoked from network); 13 Jan 2026 16:31:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:31:13 +0100
X-UD-Smtp-Session: l3s3148p1@VHtDrkZIiOgujnvx
Date: Tue, 13 Jan 2026 16:31:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries
 for brcm,iproc-nic-i2c
Message-ID: <aWZlOydXFVQMVL6d@ninjato>
References: <20251215212805.3322218-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212805.3322218-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073116_678504_CA0D0ED8 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Dec 15, 2025 at 03:28:05PM -0600, Rob Herring (Arm) wrote:
> The brcm,iproc-nic-i2c variant has 2 reg entries.
> 
> The second one is related to the brcm,ape-hsls-addr-mask property, but it's
> not clear what a proper description would be.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to for-current, thanks!


