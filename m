Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D18C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzFDlsLuM/iaBakSJFMWtsb2SnQd/z1CHs2oGFR7Zqw=; b=LuKtyDzemmqxXwHLgPhpxZnXF4
	TEP0YJmztv7n8sSDoXU+H2TYBqd17mY44WQUXh+mLkbeGtMBiiRwos0dpvxuQOGcJv8EuZFtSTl/v
	P0/Z5Gx8bnUhF2uN7SEyHofE9agmzQpefBXATAcpGDlKrdUV/S0yrAXWbiq2PT6HtXHntJaH2okf+
	QurSx+nUup2ZknvNLLlsLL8qS75Zy5Q7tKR+Xv6n7V5v09OC56pyv94Xv0bORB6DVgA9J37ltDsoQ
	CKK5x0Nas8gCb3heg38P9lA4yUh4q5cvaPCq6AGH7UkQMxCPLcRinQUT3OjzykK/kKkMKZJeVWJIb
	4yakiWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjJ5-0000000BDFj-0ak9;
	Thu, 26 Jun 2025 09:54:11 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUioK-0000000B7mu-3fKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:22:26 +0000
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 5876BBC42F;
	Thu, 26 Jun 2025 09:22:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id BAEC92002A;
	Thu, 26 Jun 2025 09:22:10 +0000 (UTC)
Message-ID: <2856e6204315895e5f87e7cb9dddbd40056ae4a4.camel@perches.com>
Subject: Re: [PATCH net-next v2 3/3] checkpatch: check for comment
 explaining rgmii(|-rxid|-txid) PHY modes
From: Joe Perches <joe@perches.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Andrew Lunn
	 <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray	
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,  Siddharth Vadapalli	 <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Tero Kristo	 <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Thu, 26 Jun 2025 02:22:09 -0700
In-Reply-To: <f593ed6162e34aa354eff6cc286cb24294195ee1.camel@ew.tq-group.com>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
		 <bc112b8aa510cf9df9ab33178d122f234d0aebf7.1750756583.git.matthias.schiffer@ew.tq-group.com>
		 <c954eabf-aa75-4373-8144-19ef88e1e696@lunn.ch>
	 <f593ed6162e34aa354eff6cc286cb24294195ee1.camel@ew.tq-group.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Stat-Signature: fdsczjqjnzc3q1naeru8np581p4obdjn
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: BAEC92002A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX199FlgeWTMybsnD9KqIg0025hPZzeZgi3I=
X-HE-Tag: 1750929730-464223
X-HE-Meta: U2FsdGVkX18YQsU6+EI8XeumX4oi9QkmeOW4FifwSa78bSxfz3sAy+vY4EU6fgqcTc3nCoLPgopnIuP3KrbAqiTmOUvxJpdzcDtqOgN8A7UA5eZrWcP0pkSkRGXk678Mftkha41gKzEsqWDjQ8RnZb7BzsWNwam9doI7gOeVZdV76fY2RW1eP6V2BFhSFJZACUq4cgc/q+PDsrGrCButEfXjtiGF1eylFu5BgJFl7KyvdepWJfxI+92AZ+WLnsiuNWMCmWsk60fMz68bQNVJERdenQHBqIsY5pgNBGJ4kgwCe2elSTemC3badHvGVYZs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_022224_967960_E1F2DE94 
X-CRM114-Status: UNSURE (   8.35  )
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

On Thu, 2025-06-26 at 10:11 +0200, Matthias Schiffer wrote:
> I don't know what tree checkpatch usually goes through, MAINTAINERS doesn=
't list
> a specific repo. The whole series could be merged via net-next if that's =
fine
> with the checkpatch maintainers.

Merging via net-next is fine with me.

Andrew Morton is the typical upstream path for random checkpatch
changes.

