Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB19CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJU8EAC9I7Spvd0nK3+SuI/L+eH9UzP8lKuPKonV7lk=; b=0FZVAW/bxzQjCYdkA+Pt4Ejh7T
	QhlmiI/NHpMutcutW/h+UvL0kgEgVgFPK4aJPQZbllgJTj1/OgloZKH3+K5geFqxWjUmYt8bfi6b0
	9+W3CDDOLeRilEca8HDU6ZFepSsy4ZhkVa03qtzff0LqEQqyu6MqV00oW1ozW6PdoPyZxOlifOtqx
	I9b73FM2Qvpbjhsn7EZkfXYbsTaHRg8AngJ9nLlmIok4OAKE/z/qE4iU+toetLSlSBK9YMSCHzgVL
	RGiGNpjXkVqeNlSB55dtis/p0XvsuU2xsaOA6d/U5/Z6Yr83dzvvSk2Wfvgy3dVeQ4KcRp6BZs8+w
	kfTRU9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4nG-00000003DS5-1sdK;
	Wed, 27 May 2026 03:18:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4nD-00000003DRl-0iIl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779851925;
	bh=zJU8EAC9I7Spvd0nK3+SuI/L+eH9UzP8lKuPKonV7lk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=igtWyFI4rXsCZDEXA0z1LVxggWUxjy5e7qIQWXxdVYIY+6OqjUNjbwEjoxxUra4r6
	 kujgGJKcVPyV2jB8Pxr6Qx8fL3TpnII9O1zjy/4Sdn1s9VJL2A43Rj8bM7pA6NvWQC
	 nzXCDqaFOBKifl9Trm7SNdtyq9dojbxLyNz3irLaOssUL60FDZp1VCNqdIyPxgUS/Y
	 5/TbtsPbflpvLqAh9ozZ2LvAYWsF9saU/WJ8jATIE27YZtkxQM8wvf5zVmv2zio16h
	 24r9DkzcnalRQ+MxDU17eYhOymUzmNs0xO3lxKNwJWjJWr+rrt/Ld/uPs3MSQWYVkm
	 ZtoMgDU6dZOHQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8729D6001B;
	Wed, 27 May 2026 11:18:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: Update DTS file
Message-Id: <177985192444.444390.3815686212940487089.b4-ty@b4>
Date: Wed, 27 May 2026 12:48:44 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_201851_406224_D003192C 
X-CRM114-Status: UNSURE (   6.22  )
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

On Sat, 23 May 2026 10:28:06 +0800, Potin Lai wrote:
> Update the SanMiguel DTS configuration to fix incorrect GPIO
> linenames and resolve the IOEXP interrupt handling issue.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


