Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8E8FD4F06
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmlweOlRxI9TYGhuStgUAoSkF3murzujj5mzJOXAUP4=; b=GCvmySA+EkiNFyCtQlUb6BGAc+
	gQqEDo8IqdY0ZiAVkWwC9K55gqKlEwPvDPJbXwEwWXQu7F66mYVjPgjUuR29yUZtgh71JZ12jfvmP
	on6hju9PHXaQ9KoLNyxWIOqiLy6gd2YTy3NK74HG+MiVFDaTnAs+b1W/5XW4qzRgKWjkt67ZlDP7Z
	W2vMgPlPI2tpLVrNmz/2mTSJoCdA+1vO0ZLq9NKU/IgVVHY0aY9tzyuTFqfBwvhuejvtt4np46v/u
	Rx9lns3HbtIhckQ2HH2VxZuC56MNjzIaxsaopCTX901IDI3RZZRexbDoN2mII+j+arq+gMsvZnHws
	nG1UINqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzztp-00000009ui9-0PB6;
	Tue, 10 Mar 2026 16:25:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzztn-00000009uhn-1Ea6;
	Tue, 10 Mar 2026 16:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZmlweOlRxI9TYGhuStgUAoSkF3murzujj5mzJOXAUP4=; b=qcreGSmD2NWlfSWfQ9V5B6AdSQ
	zA/HYMCvReWBEtW4F6/FhSa68UEJTs0XKZzDObABUzfwOHJwJl2O1AWWfF1f+kxeYsDLxoB+2Ny6o
	jiWY6EQlkxxNxMF7HQZzqMw/rjykdPN2Ah2VS0w5CYV9goPFTkv2l6oT/Ti8OikVElpY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vzztf-00B3Ui-RB; Tue, 10 Mar 2026 17:25:27 +0100
Date: Tue, 10 Mar 2026 17:25:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Add switch node to to
 EN7581 SoC
Message-ID: <a05947c7-0cc1-4cb1-a971-0fc581949c2b@lunn.ch>
References: <20260310-airoha-7581-dsa-switch-v2-1-852692ba68b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-airoha-7581-dsa-switch-v2-1-852692ba68b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_092535_334056_2D067065 
X-CRM114-Status: UNSURE (   7.61  )
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

On Tue, Mar 10, 2026 at 05:12:47PM +0100, Lorenzo Bianconi wrote:
> Introduce dsa switch controller node to EN7581 SoC and EN7581
> evaluation board.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Fix ethernet-phy node name
> - Remove unnecessary phy-mode property in ethernet-phy nodes.

Looks sensible now.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

