Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF658C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdhUxgZQyYSaxCMjUUfFB40V7qLBLiDr0YrQlK0U/f0=; b=4dnbuQqwah41nFeA0BoVQxHOqn
	+e3gaiAGYttUg1E3Qn4LlgqKPbRp8qYXkz77s8Dgqk4XAqCcvq7TvQsJ11RVoi6KKLtlXDR2ONAAh
	60vidastNgGG2po2hUSjmdull7DKlaEG/pSYsejN/lYC8xlDeiBKDM/2JG8dDLANOgIBmcwO364Wh
	LFKgATtN0BcpejJhF1aYYo+hx2VWC9P+aGEOKTskuCOVoI9p6ZNnurhxumfXZKjZ5SYuF5sdmyfub
	/FbmyaYniJRw0GMoCbDhpXOx/EuZkcS96unesNEL9O5ufkO26Tv1J8d9cneFzJ34EfsfyioKycaR5
	hPaYDe/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomlN-0000000GPDf-0dpW;
	Sun, 02 Mar 2025 17:06:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomdS-0000000GOE3-0xl2;
	Sun, 02 Mar 2025 16:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BdhUxgZQyYSaxCMjUUfFB40V7qLBLiDr0YrQlK0U/f0=; b=Flye+ceYOqu8AECHGRU2ak4hIW
	Qd4mqblJcQpkCy9IhlJ/JEF2V53sDFWmdou971t+zeXIBACqqtlvwpJ0543vrieYUw7UPRqlQx149
	0LYhLzy4cF3wd3PiDO2ablmr1X3qOTNkmFurAdhHvTqIX1N3oWUvMsn0E9IC0IknnNOyQbBdLhasc
	6MT7E8gNJ0BtgDvSGHzlBHxJJlSYxW/83kxjLlM8szUXs7ipAOwZ221GQin52VdnMNj3o/nzc+UW8
	I9i3/n1r4YO5jJk5Zx50j+HQfNpHg3G7pnstz2SusI+aW2XnQxe26eqDlQXhBcWWeIcWGT5okwrQZ
	e9A8IvXw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tomdJ-0004JL-0R; Sun, 02 Mar 2025 17:57:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Tao Huang <huangtao@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of
 type 'struct platform_device'
Date: Sun, 02 Mar 2025 17:57:39 +0100
Message-ID: <870511149.0ifERbkFSE@diego>
In-Reply-To: <202503021302.FjsycBI2-lkp@intel.com>
References: <202503021302.FjsycBI2-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_085750_289721_3BD92A32 
X-CRM114-Status: UNSURE (   9.95  )
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

Am Sonntag, 2. M=C3=A4rz 2025, 06:53:23 MEZ schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip.git v6.15-clk/next
> head:   36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a
> commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a [10/10] clk: rockchip: A=
dd clock controller for the RK3562
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250=
302/202503021302.FjsycBI2-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250302/202503021302.FjsycBI2-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503021302.FjsycBI2-lkp=
@intel.com/

I've "fixed" the error by moving this new driver to how we handle all
other clock drivers already - not allowing them to build as module.

I've amended the original commit for that and also included the lkp report.


Heiko



