Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D19C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgI5hertI7sI8saRle0DZ/JnUHB1XYzvgxvb3HuwJqI=; b=wUyhgyoXJ5/qq5u/+7EIRpIzkf
	rsqYIykbMAwzMJOQeAoE42TUTloY8n2zeWMwIXh+MhdIZ0QyCbF85f6xrrQ4jSLVPZiRLrp754ix8
	55t2jKAOmRiOKtmPtEZzj6TfI8YEghoBpl1LFN9utuOnJp7WKBJqYBokw4f/UfwjBuDIDIn4+K5Ga
	TKO5Wc/zIBHGOAl/NkgjQW6j0gRVq164RqOjrrFRkWA2/XCHkaVFD2HPT0e4+9ZbxnzjZXiKHqlwH
	h8CcIwuJXLrAzqvGWqa9WJy9uPYjnUxZVG7rnr5XHpPYsgnVNZaIPSLAEywJLyBv0j/yO+s26uwbJ
	tdOmOLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KBA-0000000C9By-1KWH;
	Wed, 09 Sep 2026 15:25:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KB8-0000000C9BX-1lTT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B45E4139F;
	Wed,  9 Sep 2026 15:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B11F00A3A;
	Wed,  9 Sep 2026 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967538;
	bh=CgI5hertI7sI8saRle0DZ/JnUHB1XYzvgxvb3HuwJqI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=l1qlHl9qyWUbJwySqxPtdvqGRUCZVn1maDUj9c50xuPytTkfi2zSpej2kd1eJdeSZ
	 iBp9zDpoiCL1h6MgSWLtXp0U6SYuCpLxy2HU7jKjYA2QmPfO6cuQiCd1u3vhxrpyGn
	 TAAwwC+YxFDZCVYN0SvvWF/WK58E3Fv+PnKIAKSPCJpiFGbTv/FmzdaPpVI/8mTrhC
	 UnsrpkFXW/tNgRgSMwcXt8qdYowiHQPYPDrtyKGOlykm1ZMMfjwqimm4x+GeDeWQVC
	 L2dv6syMTfB34MWrENawexUWjueQbNFkDOLCB9yTvKF7dZUY/BF2jzX4c+iEHhHBxi
	 8O7LBxv3I335Q==
Message-ID: <5a8bc263-0263-4ccb-b5dd-f5e899dc25c4@kernel.org>
Date: Wed, 9 Sep 2026 17:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
From: Sven Peter <sven@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
 <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
Content-Language: en-US
In-Reply-To: <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09.09.26 17:20, Sven Peter wrote:
> Hi,
> 
> On 09.09.26 08:06, Mika Westerberg wrote:
> 
> [...]
> 
>>
>> If it is possible, I suggest to use the same way we do in ACPI side here:
>>
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd- 
>> for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled- 
>> through-usb4-to-usb4-host-routers
>>
>> It was specifically designed so that it should support DT as well (that's
>> why it uses the device properties _DSD).
> 
> Oh, nice, I didn't know those existed. Konrad already has a PR open to 
> add these to dt-schema [1] and a PR that already makes use of these for 
> dwc3 [2].
> I can just write generic code similar to the ACPI one then to add the 
> device links and split it off from this series, though I think that dt- 
> schema PR must be merged before we're allowed to use that representation.
> I'll adjust the dt-bindings here for v3 to just drop the representation 
> as OF ports/endpoints as well.
> For the PCIe/DP tunnel notifications I should be able to use the same 
> representation, possibly with an additional usb4-adapter-index property 
> or similar to differentiate between the two DP IN adapters, once I get 
> to that then.

Though now that I read it again: do you know what PortInstance# in

Package () { "usb4-port-number", PortInstance#}, // PortInstance# is 
unused and can be 0
       }

refers to? Is that meant to e.g. by 0 for the first DP IN adapter and 1 
for the second? Or is that meant to be used when the NHI handles 
multiple Type-C ports? The description isn't clear to me...



Sven


