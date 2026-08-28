Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A455C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 04:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CKdSKdLdxXqUAJ8+SDUUepiueedYKIw7PG3SRPgDmM=; b=fU5DR9EBPr45w41KZYseKSg1RK
	vAE2m1hW987IdfuXvqJv5zwuCQF26Jp6lCQVa7/KbzSxMCRBCMwaS8kTTB1VRbueFv2wBQsHL/XrM
	nTdq79EcgJKuVNBWnUeJ5tcrnbNe6m+qRNXlZ6bQzSfTrwL2Zai1oAXyKWUtKYQII6lJV0AtWZflR
	s/6kdRCYtx/agacHgtY8m78X9OcOyI039pS9jtBjhuFre9N6m0ez/pJQTyGE2V70MQHcbyTBtPo4j
	tgN7cpEu6cmepYeJk4rYUiv7Nj1Q3SxFb/VJw6FBS7IFDL81f7fO6vhx+usxS641Zo/mWV0HHXOGe
	Ir2AT09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznsv-000000055Xr-30Fr;
	Fri, 28 Aug 2026 04:08:09 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wznss-000000055XW-1B1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 04:08:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39c953950dfso5596771fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 21:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890083; x=1788494883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3CKdSKdLdxXqUAJ8+SDUUepiueedYKIw7PG3SRPgDmM=;
        b=ElYmGUwzUuRuaZxh840RLY4h3ok1R/9uXEDz83WIBzHVPyMjzIr9B+vzwHdQ1PCplc
         1VSYnI5RhjGrZwRbgHKbT9XAKis9uMWFvNAdG7BNyMLf+tS5PdHykR8KsSIL2O62aUB2
         liHj0xUdT66VB+MvPwHtOL5Vl+kqBOvngDwQbQqsohCJCcgl3hNo/qrrUAhkTz8pHWPl
         s9hnFNMRE/oeds2UWKuH6Gqfp0m7TQlSkSjv8d4NFhM/tseCVrortJEPv5qwf8hETDCl
         xlisBgC2L3ptDr5v9aCxh4W2PuXI0Qx8CbamXjQx18De6mrM1nSKz+0uBjsYhH3gWYWE
         3mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890083; x=1788494883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CKdSKdLdxXqUAJ8+SDUUepiueedYKIw7PG3SRPgDmM=;
        b=bjpUZjR9P3fkBUV8+w/XXxsRdfLNKZSJRmVlPBe8OhMibExXa9xR9viBbhxo2QoDSi
         QPeVFuvKGupnyDVJtqmAwte9+bb5pKu8BqytYb/SbpaixeC+WlYDa0ft0A6yvKXjvOyS
         NFyEmKzqVVGG/AIi/Pt5dBKEYrKYHvq4x2K4Pebj26FXnT6cYOvegVXf+2W8mfqTiczs
         EpPanz2taW68lTnGOUcW928hrNLeK9SMWM8Vi9X5rN5xOY79hUzRw1LhXgv03Wfk4WRD
         i9GYXYYetIsMV34ESi+X/Bp+oukfLDDgSywtGaqoF1+cMSxgp6Isxvqmyp4B8dEOImCk
         aKhQ==
X-Forwarded-Encrypted: i=1; AHgh+RolpBbucq3XATG09eEQuS7IHo3Tgig2hls0+LPmkxJU6oKXf+enKAEMHR3vdCVwb9UhDL9zKK2LoTiwUFhaO3QU@lists.infradead.org
X-Gm-Message-State: AFuF++k/AADXq+UaNjIKsUooyRtqOnSZAsWBk58BG8VVguFKHMSxEsMX
	VvE7sxsdQxDOcg0QiGQj2/DM8sYgticPqe2hTjLszas7gubkJn5As3Nc
X-Gm-Gg: AR+sD127lUY7UFf7ExLQXedEWI1LYEqj6p0iOd47ystUpyqCnR62HfrsZKjUzSKBx5i
	9Xkn2MAp/GWYloE4NkjOrGccceaD3+gYeltusj5QVV/Jlo7CF76Uu7ja5XedbWs0i5SnggjLZeb
	zDlum7DEdGILTKGacTL5qLcNVHe09GBlLCMbLNJzgbH+/KUoffvtlOs6CKUBVcfIyVf8mp2o9Mq
	NwQPb8FNvd6lmCv4TQ8BP0paWGt8yHSlBiQk3ldyJZ3CWVjboPu2Inm/iEItY1E2cOsWULSokK7
	3/BBSxuRAo3fLGclL9WHz3zM0HXiuTyC28j3i/U7X9PSKLBNOGqHuDTv4p1ljj4rQcA7Hh6FAhl
	rxFqAg2fYvOU4t/FOHqGBIxG5Gsz4OSiFwX2SACTPpQBNROuO2v/o4/nSBzjww2LxQLUaOhkR8k
	Jc1Uer8qxqxDPo9cwjEhXxsWEvMGMvT/ODYfCN7cYXsWlWmcQJy0aIIC2pW+HGFF0=
X-Received: by 2002:a05:651c:1445:b0:3a2:eb57:8a99 with SMTP id 38308e7fff4ca-3a301afd639mr5669501fa.9.1787890083299;
        Thu, 27 Aug 2026 21:08:03 -0700 (PDT)
Received: from mobilestation ([2a00:1fa1:829d:a0d6:4e24:60c8:bd9:494f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a305575833sm701491fa.35.2026.08.27.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:08:01 -0700 (PDT)
Date: Fri, 28 Aug 2026 07:07:15 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org, 
	joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 2/5] net: stmmac: Move double VLAN handling to a
 dedicated op
Message-ID: <wmeffk2whc47cwfxnsrs46lwmd52n3ezwb5un6qn4nwnturqie@pd77k47zoeka>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
 <20260825164522.4244-3-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825164522.4244-3-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_210806_382786_38A2C31B 
X-CRM114-Status: GOOD (  16.39  )
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

Hi Ovidiu

On Tue, Aug 25, 2026 at 04:45:19PM +0000, Ovidiu Panait wrote:
> The double VLAN bits (EDVLP, ESVL, DOVLTC) are currently handled inside
> update_vlan_hash(). This ties the double VLAN state to the hash filter
> update, even though the two features are independent: hash filtering is
> controlled by dma_cap.vlhash and double vlan by dma_cap.dvlan.
> 
> In preparation for removing double vlan support from dwmac4, move the
> double vlan logic into a separate update_dvlan_state() VLAN operation.

The S-VLAN implementation in STMMAC is a complete mess. It seems like
the original code author didn't fully understand what he was doing.

Double VLAN feature of DW *MACs has nothing to do with S-Tag VLANs.
It merely provides a way to insert/extract/filter an additional level
of VLAN header - inner. That's it. Seeing the networking subsystem
provides only the outer VLAN header for HW-accelerations, having the
DW MACs somehow working with the inner one is not only redundant but
had been harmful up until a recent kernel. The Tx path has been fixed
there.  What you see here is a leftover of the incomplete fix.

Anyway if you feel like cleaning up a mess here then the only correct
solution would be to almost completely drop any double vlan stuff from
the VLAN implementation of the driver. That is:
1. Drop EDVLP flag toggle. But preserve the flag being always set
otherwise COE won't work for packets with an inner VLAN header.
2. Rename "double" word to "svlan".

You must not touch the ESVL and DOVLTC flags, since they are responsible
for the S-VLAN tags handling, have nothing to do with the Double VLAN
feature, and must be set so VLAN hash-based filter would perceive
VLAN S-tagged packets.

If you need to make DW GMAC4 not stripping VLAN S-Tags on Rx packets,
then you have to find a way to prevent the networking core from
enabling HW-accelerated S-Tags handling.

-Joseph

> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v3 changes:
> - Rebased after dropping the dma_cap.dvlan patch.
> - Added "Reviewed-by" tag from Maxime.
> 


