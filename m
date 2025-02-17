Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693BFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcU/Mrdr18cGs3dTnCLq4um8s+90+rSXo/XjDVljqqs=; b=pCYxit1HFLlxl9/LC3pxzeDltE
	mvdNW4Q5niLiEUfEkPh3C5iplGqvltGKUm4mcSZ6mFqo6xe2TiaylxBghQTSQ0IlsghCSKwjE5Uzd
	3YX7R3ue4idSW+HsCh9mpjxjV30m4oh53YqWW+fS3fkwMAahoG7HfpV5//0qKnz0p8ShT8niwgv82
	laPmgF+kibZ7Cituqgm68Xud8hKlkNQIuzzK/8VlZq7Gku39vdzkGcrN75jyuRdcjnMHWeY6S0Nq4
	xMti5b+shxajk5FuxYOyGBzy5H6Mi3MfuJyfHJh3kOJVG2lH7Y1riqCXNcgRijA0ss5CHeSUrsObE
	6ilGTQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjojo-00000002rqu-0E8Q;
	Mon, 17 Feb 2025 00:11:52 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjoiL-00000002rfJ-3OQA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 00:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739751013;
	bh=JcU/Mrdr18cGs3dTnCLq4um8s+90+rSXo/XjDVljqqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FfU3qebSurQNgcxzYBYi8q46USfa5cym7WWDYWfYGlOG+JJkETsZRLR5jcu7jDH+Z
	 VXszDdoBHfNr9qcdQGZVmwlHuy/EHjbLACc06SRFlOWNrDOvbXuR1Qk1FNrdUkizKL
	 ef8/noP7BTqMblsLm3qEnKxNkoOvVv0uZNGwyL8pQtig/RUUK7391c8bwuQO4UEHy5
	 LQWGMzlQiCc2L2WMms7mGCGX5ryTXMKnI0boqITdXMqjv5oBD9PcaS3mjWu64VSvCV
	 LX6qMGvh/EYLaRvLLV1DKBIk5AfPmvRl9VOWnG2H2ybmHzoZdvg1ZL7yOyXIAz+u8o
	 2FKb+V+lCD7TA==
Received: from [127.0.1.1] (ppp118-210-174-88.adl-adc-lon-bras34.tpg.internode.on.net [118.210.174.88])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C910C72F1E;
	Mon, 17 Feb 2025 08:10:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20250213-bletchley-dts-fix-v1-1-c953315eb894@gmail.com>
References: <20250213-bletchley-dts-fix-v1-1-c953315eb894@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: remove unused
 ethernet-phy node
Message-Id: <173975100971.56771.12087846830640085961.b4-ty@codeconstruct.com.au>
Date: Mon, 17 Feb 2025 10:40:09 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_161022_055977_E67CF199 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, 13 Feb 2025 15:12:58 +0800, Potin Lai wrote:
> Remove the unused `ethernet-phy` node and the `phy-handle` property
> from the Bletchley device tree. This fixes warnings reported by the
> kernel DTB checks.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


