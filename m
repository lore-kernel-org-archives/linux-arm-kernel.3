Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69377C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nvabop0zm4uonzH0zzDptm+Kpsf6ujwvdHILYs5XWCY=; b=OOv+kBi21xxH42Oi/EeTXowTsN
	Ib8n1xbOLKL7IIvY/XTIXSSckysoTg2M2i62dZh+ktfxtEH+qHl65jzvsfpe9VZNz0MdEdoNqql+M
	u/nXXcA2UmPFxc4eNKnDYNjl27jx8q0e67/6W7LgxHpVTQCY+gh5ZZYWAQRg2RUoWjzaSDNsGEsPE
	O+Se/BXLiFQFyE6RBby60sQTog3X6KSVcbQt/zGgY763z8i1fxYsy7vQCFU4BX6Dk9dNNjTMic083
	jR0rm+ymHu8V52XZlU1W7TApp0VfonR8msNSRcZ77Wk9cdV2CmtlQN3Qw8V2lK/cFQNjPVdn/fAWm
	vZJJ63AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Ri-00000008kJM-3lLq;
	Wed, 29 Jul 2026 17:51:58 +0000
Received: from mail-106104.protonmail.ch ([79.135.106.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8RR-00000008k8v-1CtB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=bdbrvf4m5fhfffknshqtzcbnve.protonmail; t=1785347496; x=1785606696;
	bh=Nvabop0zm4uonzH0zzDptm+Kpsf6ujwvdHILYs5XWCY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=j3y7A7OIV58ZSQvK9RNzYnMMOrH9H5g3fVumitLIXxRBNi3uqPYKl+7pkhZaU+2pC
	 YkbRDMmB4XIMzYhxirZlj3xs6+sPez45sE/V/KVwYKmH5EAF0k758sc2nu4vhd7P5q
	 a37oPqBr75CgWZtnCNwdkq46J30nHktpYQJ+uWwrBfgTZsLK06gSxYEt//lGrcCClt
	 SJoN332C2geB1MYjLx2b8BY2Eae+jD/Aw6fBKH3jE18bJqJGxQL1AGwSEC9aEk1raP
	 nhCBVjfGgCvnSyKdmOfExTVyao4E1N9aKOfFjqKghdGNoyXJdbYBGju2EWx6PV7BG9
	 Z43O0nyKro3+w==
Date: Wed, 29 Jul 2026 17:51:31 +0000
To: Ferass El Hafidi <funderscore@postmarketos.org>
From: Robazza Alberto <robazza.alberto@proton.me>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Message-ID: <XEr1g-aJeRsEJnbiy88DnzHi1_SQcZ0yL50jp2uYuQsQDw-eqyTfYI3xxoeVAWw7rVTwTTNPFGzA5FZBXguG5DAay2isJHh_RktUE_LWSn4=@proton.me>
In-Reply-To: <tiy37g.1ypi45yn8qibx@postmarketos.org>
References: <20260729141234.65037-1-robazzalberto@gmail.com> <20260729141234.65037-2-robazzalberto@gmail.com> <tiy37g.1ypi45yn8qibx@postmarketos.org>
Feedback-ID: 89419976:user:proton
X-Pm-Message-ID: 54e220e002fbf84dc033cd47950f2f0f59679da4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_105141_496021_875CF771 
X-CRM114-Status: GOOD (  18.43  )
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

Thank you for the feedback. I didn't ignored, indeed the suggestion was imp=
lemented in v4. My bad!

Regards,
Alberto

On Wednesday, July 29th, 2026 at 18:31, Ferass El Hafidi <funderscore@postm=
arketos.org> wrote:

> Hi Alberto,
>=20
> On Wed, 29 Jul 2026 14:12, Alberto Robazza <robazzalberto@gmail.com> wrot=
e:
> >Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
> >3D depth cameras and embedded vision boards.
> >
> >Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> >---
> > Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > 1 file changed, 2 insertions(+)
> >
>=20
> You seem to have missed Krzysztof's Acked-by tag in this patch:
> https://lore.kernel.org/all/20260729-unbreakable-observant-clam-ca4f6d@qu=
oll/
>=20
> Reviewers will typically give out Acked-by or Reviewed-by tags to your
> patch to signal that the patch looks good to them (typically the former t=
ag)
> or that they have reviewed it in great detail and approve it (typically t=
he
> latter tag). These tags need to be picked up and added to your patch.
>=20
> If you use b4 to send the patches, you can run `b4 trailers -u` each
> time before sending a new patchset revision to the mailing list to get
> all Acked-by and Reviewed-by tags reviewers will give to your patch.
> If you don't use b4, you should be able to add them manually still with
> git commands.
>=20
> If you don't have them added to your patch, it may sound like you
> ignored their review. Reviewing takes effort and is time-consuming,
> so always make sure you have all of them added.
>=20
> Also see: https://docs.kernel.org/process/submitting-patches.html
>=20
> Best regards,
> Ferass
>=20
> >diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Do=
cumentation/devicetree/bindings/vendor-prefixes.yaml
> >index 396044f36..a42899bd2 100644
> >--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> >@@ -1251,6 +1251,8 @@ patternProperties:
> >     description: Option NV
> >   "^oranth,.*":
> >     description: Shenzhen Oranth Technology Co., Ltd.
> >+  "^orbbec,.*":
> >+    description: Orbbec Inc.
> >   "^ORCL,.*":
> >     description: Oracle Corporation
> >   "^orisetech,.*":
> >--
> >2.55.0
> >
> >
> >_______________________________________________
> >linux-amlogic mailing list
> >linux-amlogic@lists.infradead.org
> >http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

