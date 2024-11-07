Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFE3D5D699
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 23:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5bjyyAWYr+VR/DxJGgp7mRweAiKTLFWuDoMtqHPdt4=; b=dClRiBIzJWyVOlKfXc+LnHgIzs
	QRoEvTvW1zI0Ch/i+bgyjOSX/cVPrYT9iaDrfhRcjYIdmXl6rUjI2cTzPRADRnnKeBfy12e6Pdr03
	mTm+aeF83/07YW/y2lL1R7oD/mFkn6c719FvLt6MCpEkI8H4Q47/HEIQN1/Pwl+2DGMYuJg1S5sAr
	uH44RLrjn7HGhNMYHOmed7YX1wZ4WQCSOkiLBM1XvgYtCUncIC3MXha2TA2ZwVOYvP5DbCCscBkyp
	l1qE8+pNk8D9fVpBSb7IbOGXubma3SoVOXf1sVi92c+LHS9f9BAqW/ZE3qLqhlNIeWU804R1d0dmz
	S0UoUYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9CJy-00000008mHe-0zCd;
	Thu, 07 Nov 2024 23:53:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9C67-00000008jxZ-1IGN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 23:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731022768;
	bh=A5bjyyAWYr+VR/DxJGgp7mRweAiKTLFWuDoMtqHPdt4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bqOTL1V0niQ4ld27SUYcHlDmAaoq5xSdE6TM4Cu7mkF2RsEJpecqiqyVPuUWIGNTQ
	 ICeHH8E6VMmRL/ULBPyjNck8NZar70M3f+zzThxoac1+zdqPdiiMrkzs4C7+bcp99z
	 axJyWMyc4x/hr9s/0Q0Aj5PMHlc/YeR54n+Bjj1Hgn59bxgRW2Siyhf44zq/Q4IDfq
	 C+qwyMxmczr1dL5D3Rq6H39SlHeiDYjRWeMIaTVN2F9ete38v8BRjqJLMcET5rIJqG
	 XogJixa7Ie4sXmj0XViwanp/VzRMD6l4uwBb2YTQRRKiKpnp1fhz/n49FnwzomV4UP
	 TvY7qz6AgVqIw==
Received: from [192.168.68.112] (ppp118-210-167-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.167.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AB35C6B922;
	Fri,  8 Nov 2024 07:39:27 +0800 (AWST)
Message-ID: <696cbaeefd0f731a1883771da3caa308ffcd03d5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: catalina: update pdb board
 cpld ioexp linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org, Potin Lai
 <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Date: Fri, 08 Nov 2024 10:09:27 +1030
In-Reply-To: <20241107-catalina-cpld-ioexp-update-v2-1-d7742eabc0e6@gmail.com>
References: <20241107-catalina-cpld-ioexp-update-v2-0-d7742eabc0e6@gmail.com>
	 <20241107-catalina-cpld-ioexp-update-v2-1-d7742eabc0e6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_153931_558980_59AB0888 
X-CRM114-Status: UNSURE (   5.78  )
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

On Thu, 2024-11-07 at 20:39 +0800, Potin Lai wrote:
> Due to there are huge changes of PDB CPLD IOEXP pin definitions since
> DVT version,

If this is a different (revision of the) board, maybe it should have a
different dts file?

See the on-going conversation on v1.

Andrew

