Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBFBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d1ca8VsJfO0Ig/PkeHWD5DeXwb0tdWNAe+6wr2gJH9Q=; b=GDtT+2PxOxBuHY
	wsFK5k3S6HvsFBZLnwkRjqAOWlIX7N5Hb+HniqD0UixP+GqZ8L1OS4LLSY8sxQyDSwRtjyCPgLmTY
	MlV5kngEolPw6NVXG02pCNCxie9+enVOqkdEXfN9agoGke2m+L8yvHAPbZZIkH70yZZG5hHU+eBqw
	9D1mATkiuFu2hJE3ZjKtWqliqQbQtqPASSWuLMaHfrGvBB37H5D4bQ6uuAAXNaga86KErr4jHEoVb
	5LIhXU59Sdq+4+OgAXVyfFLYGMJ3eGyF7vnhr6VkPGoQy51M8Nzvf0YmHKOKVmt9YaRDeKtEgB2HA
	tEWrbB6aA94fm9jWWFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqL4d-0000000CY1C-3Kxy;
	Thu, 06 Mar 2025 23:56:19 +0000
Received: from mail49148.delibird0004.locaweb.com.br ([201.76.49.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqL30-0000000CXui-07Mf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:54:39 +0000
Received: from mcbain0020.email.locaweb.com.br (189.126.112.15) by mail49232.delibird0004.locaweb.com.br id hp8qh62n8lgl for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Mar 2025 20:51:45 -0300 (envelope-from <sistema@brmidias.com.br>)
Received: from proxy.email-ssl.com.br (unknown [10.31.120.236])
	by mcbain0020.email.locaweb.com.br (Postfix) with ESMTP id 5AC6714801CF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 20:53:32 -0300 (-03)
x-locaweb-id: DA9d78gBEGR_yiUBYajof3AdoNkH-4g4H8mmnSAiuv3fhJNzuLZcde8Pi_p5jZc65LOl2btV0vBJZ5Pay6dOOG3Mh9ZahtY1A8aZzn6QpAlk-Ml9GrJNbH4YU_QAxeOljP4oPOofN_uZJNErxe5yAMQmQygg4E9Mum8wefSMP06RBw1nR7-9bMYXCtr_Dd6ep5_Ci9ItvzyPqa6kVkRUHA== NzM2OTczNzQ2NTZkNjE0MDYyNzI2ZDY5NjQ2OTYxNzMyZTYzNmY2ZDJlNjI3Mg==
X-LocaWeb-COR: locaweb_2009_x-mail
X-AuthUser: sistema@brmidias.com.br
Received: from ec2-18-227-52-104.us-east-2.compute.amazonaws.com (ec2-18-227-52-104.us-east-2.compute.amazonaws.com [18.227.52.104])
	(Authenticated sender: sistema@brmidias.com.br)
	by proxy.email-ssl.com.br (Postfix) with ESMTPSA id A413D4C0D5F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 20:54:20 -0300 (-03)
From: sistema@brmidias.com.br
To: linux-arm-kernel@lists.infradead.org
Subject: Sign and return #423 Date:3/6/2025 11:46:21 PM
Date: 6 Mar 2025 23:54:18 +0000
Message-ID: <20250306234621.1DE8FB8489D38C55@email-ssl.com.br>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_155438_234039_AC39F69F 
X-CRM114-Status: UNSURE (   0.98  )
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
Reply-To: ifaldazos@federante.com.ar
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello linux-arm-kernel,

I=E2=80=99m Jordan Patel from Federante Ltd. We=E2=80=99re interested in pl=
acing=20
an order and would love to see your latest product/service list=20
along with pricing.

Could you kindly send the details to ifaldazos@federante.com.ar=20
at your earliest convenience?

Looking forward to your response.

Best regards,
Jordan Patel
Federante Ltd.

